import 'dart:convert';
import 'package:classifiedapp/services/auth.dart';
import 'package:classifiedapp/views/admin/edit_ads_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class myAdsScreen extends StatefulWidget {
  var adInfo = {};
  myAdsScreen({Key? key, required this.adInfo}) : super(key: key);
  @override
  _myAdsScreenState createState() => _myAdsScreenState();
}

class _myAdsScreenState extends State<myAdsScreen> {
  // FUNCTION FOR GETTING MY ADS LIST
  var _myAds = [];
  Auth _auth = Get.put(Auth());
  getAds() async {
    try {
      var token = _auth.token.value;
      await http.post(
        Uri.parse("https://adlisting.herokuapp.com/ads/user"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ).then((resp) {
        var data = json.decode(resp.body);
        setState(() {
          var data = json.decode(resp.body);
          _myAds = data["data"];
        });
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ads"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: _myAds.length,
          itemBuilder: (bc, index) {
            return GestureDetector(
              onTap: () {
                Get.to(EditAdsScreen);
              },
              child: Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      height: 100,
                      width: 60,
                      child: Image.network(
                        _myAds[index]["images"][0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _myAds[index]["title"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "18 days ago",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            _myAds[index]["price"].toString(),
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
