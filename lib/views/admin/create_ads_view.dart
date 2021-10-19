import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({Key? key}) : super(key: key);
  @override
  _CreateAdScreenState createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  //CAPTURE IMAGE
  var isCaptured = false;
  var path;

  @override
  void initState() {
    super.initState();
  }

  capture() async {
    await ImagePicker().pickImage(source: ImageSource.camera).then((file) {
      print(file!.path);
      setState(() {
        isCaptured = true;
        path = File(file.path);
      });
    });
  }

  //FORM'S CONTROLLERS
  TextEditingController _titleAds = TextEditingController();
  TextEditingController _priceAds = TextEditingController();
  TextEditingController _mobileContactAds = TextEditingController();
  TextEditingController _decriptionAds = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: isCaptured
                      ? Image.file(path, height: 110, width: 110)
                      : Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: ListTile(
                            title: Icon(
                              Icons.add_a_photo_outlined,
                              size: 50,
                            ),
                            subtitle: Text(
                              "Tap to upload",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              capture();
                            },
                          ),
                        ),
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
                          // Get.to(HomeScreen());
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
