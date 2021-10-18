import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/profile.jfif"),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              "Andy",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            child: Text("9999999999"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          // Get.to(FirstEditProfile());
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    ListTile(
                      leading: Icon(Icons.post_add_outlined),
                      title: Text("My Ads"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    ListTile(
                      leading: Icon(Icons.post_add_outlined),
                      title: Text("My Ads"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    ListTile(
                      leading: Icon(Icons.post_add_outlined),
                      title: Text("My Ads"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
