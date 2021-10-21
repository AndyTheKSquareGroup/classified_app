import 'dart:convert';
import 'package:classifiedapp/views/admin/create_ads_view.dart';
import 'package:classifiedapp/views/admin/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //GET DATA
  var _infoAds = [];
  Future getAllAds() async {
    var url = "https://adlisting.herokuapp.com/ads";
    await http.get(Uri.parse(url)).then((resp) {
      print(resp.statusCode);
      var _resp = jsonDecode(resp.body);
      _infoAds = _resp["data"];
      setState(() {});
    }).catchError((e) {
      print(e);
      print("Error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Ads Listing"),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            //ACCESS TO SETTINGS
            onPressed: () {
              Get.to(
                SettingsScreen(),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("images/profile.jfif"),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateAdScreen());
        },
        child: Icon(Icons.add_a_photo_outlined),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
// images/profile.jfif