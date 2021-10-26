import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:classifiedapp/services/auth.dart';

// ignore: must_be_immutable
class EditAdsScreen extends StatefulWidget {
  var adInfo = {};
  EditAdsScreen({
    required this.adInfo,
  });

  _EditAdsScreenState createState() => _EditAdsScreenState();
}

class _EditAdsScreenState extends State<EditAdsScreen> {
  // FUCNTION FOR GETTING MY ADS
  Auth _auth = Get.put(Auth());
  var apiURLAds;
  editMyAds() {
    var body = json.encode({
      "title": _titleAds.text,
      "price": _priceAds.text,
      "mobile": _mobileContactAds.text,
      "description": _decriptionAds.text,
      "images": updatedImg,
    });
    try {
      var token = _auth.token.value;
      http
          .patch(
        Uri.parse("https://adlisting.herokuapp.com/ads/:"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: body,
      )
          .then((res) {
        var data = json.decode(res.body);
        _auth.set(data["data"]["token"]);
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print(e);
    }
  }

  //UPLOAD IMAGES
  var updatedImg = [];

  getImages() async {
    try {
      var images = await ImagePicker().pickMultiImage();
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("https://adlisting.herokuapp.com/upload/photos"),
      );
      images!.forEach((image) async {
        request.files.add(
          await http.MultipartFile.fromPath(
            "photos",
            image.path,
          ),
        );
      });
      var response = await http.Response.fromStream(await request.send());
      var data = json.decode(response.body);

      setState(() {
        updatedImg = data["data"]["path"];
      });
    } catch (e) {}
  }

  //RECOVERED DATAS
  @override
  void initState() {
    setState(() {
      _titleAds.text = widget.adInfo["title"];
      _priceAds.text = widget.adInfo["price"].toString();
      _mobileContactAds.text = widget.adInfo["mobile"];
      _decriptionAds.text = widget.adInfo["description"];
      updatedImg = widget.adInfo["images"];
      var id = widget.adInfo["_id"];
      apiURLAds = Uri.parse("https://adlisting.herokuapp.com/ads/$id");
    });
    super.initState();
  }

  // CONTROLLERS FORM
  TextEditingController _titleAds = TextEditingController();
  TextEditingController _priceAds = TextEditingController();
  TextEditingController _mobileContactAds = TextEditingController();
  TextEditingController _decriptionAds = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Ad"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                buildPhotoIcon(),
                updatedImg.isNotEmpty
                    ? buildPhotosPreview()
                    : SizedBox(
                        height: 40,
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //ADS' TITLE
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _titleAds,
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
                        controller: _priceAds,
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
                        controller: _mobileContactAds,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Contact Number",
                        ),
                      ),
                    ),
                    //ADS' DESCRIPTION
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        minLines: 3,
                        maxLines: 5,
                        controller: _decriptionAds,
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
                          editMyAds();
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

  GestureDetector buildPhotoIcon() {
    return GestureDetector(
      onTap: () {
        getImages();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 7,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          shape: BoxShape.rectangle,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(7),
        width: 120,
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo_outlined,
              size: 50,
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              alignment: Alignment.center,
              child: Text(
                "Tap to upload",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildPhotosPreview() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      height: 130,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: updatedImg.length,
        itemBuilder: (bc, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 120,
              height: 120,
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                shape: BoxShape.rectangle,
              ),
              child: Container(
                width: 110,
                height: 110,
                // margin: EdgeInsets.symmetric(
                //   horizontal: 10,
                // ),
                padding: EdgeInsets.all(
                  10,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      updatedImg[index],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Icon to save image

