import 'dart:convert';
import 'package:classifiedapp/views/admin/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../services/auth.dart';
import 'package:http/http.dart' as http;

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({Key? key}) : super(key: key);
  @override
  _CreateAdScreenState createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  //FORM'S CONTROLLERS
  TextEditingController _titleAdsCtrl = TextEditingController();
  TextEditingController _priceAdsCtrl = TextEditingController();
  TextEditingController _mobileContactAdsCtrl = TextEditingController();
  TextEditingController _decriptionAdsCtrl = TextEditingController();

  //TOKEN TO CREATE ADS LOGIN
  Auth _auth = Get.put(Auth());
  createAds() {
    var body = json.encode({
      "title": _titleAdsCtrl.text,
      "description": _decriptionAdsCtrl.text,
      "price": _priceAdsCtrl.text,
      "mobile": _mobileContactAdsCtrl.text,
      "images": imagesAds
    });
    var token = _auth.token.value;
    print(token);
    http
        .post(
      Uri.parse("https://adlisting.herokuapp.com/ads"),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: body,
    )
        .then((res) {
      print(res.body);
      Get.to(
        HomeAdsScreen(),
      );
    }).catchError((e) {
      print(e);
    });
  }

  // CAPTURE IMAGE
  var imagesAds = [];
  var isCaptured = false;
  var path;

  captureImages() async {
    try {
      var capturedImages = await ImagePicker().pickMultiImage();
      var redRequest = http.MultipartRequest(
          "POST", Uri.parse("https://adlisting.herokuapp.com/upload/photos"));
      capturedImages!.forEach((photo) async {
        redRequest.files.add(
          await http.MultipartFile.fromPath("photos", photo.path),
        );
      });
      var result = await http.Response.fromStream(await redRequest.send());
      var data = json.decode(result.body);

      setState(() {
        imagesAds = data["data"]["path"];
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Ad"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  padding: EdgeInsets.all(13),
                  child: ListTile(
                    title: Icon(
                      Icons.add_a_photo_outlined,
                      size: 50,
                    ),
                    subtitle: Text(
                      "Tap to upload",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      captureImages();
                    },
                  ),
                ),
                imagesAds.isEmpty
                    ? Container(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        height: 120,
                        width: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: imagesAds.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (bc, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 120,
                                height: 120,
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        imagesAds[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : SizedBox(height: 120),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //ADS' TITLE
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _titleAdsCtrl,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Title",
                        ),
                      ),
                    ),
                    //ADS' PRICE
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _priceAdsCtrl,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Price",
                        ),
                      ),
                    ),
                    //ADS' MOBILE
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _mobileContactAdsCtrl,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Contact Number",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        minLines: 3,
                        maxLines: 5,
                        controller: _decriptionAdsCtrl,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Description",
                        ),
                      ),
                    ),
                    // BUTTON ENTER TO APP
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          createAds();
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            primary: Colors.deepOrange),
                        child: const Text(
                          "Submit Ad",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
