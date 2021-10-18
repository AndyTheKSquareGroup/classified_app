import 'dart:convert';
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
  var resource = "https://codesundar.com/wp-json/wp/v2/posts";
  var _event = [];
  getInfoForEventsStudents() async {
    try {
      await http.get(Uri.parse(resource)).then((res) {
        print("sucess");
        print(res.body);
        var resp = json.decode(res.body);
        setState(() {
          _event = resp;
        });
        _event = resp;
      }).catchError((e) {
        print("Error");
        print(e);
      });
    } catch (e) {
      print(e);
    }
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
      body: Center(
          child: _event.length == 0
              ? Container(
                  color: Colors.amber,
                )
              : ListView()),
    );
  }
}
// images/profile.jfif