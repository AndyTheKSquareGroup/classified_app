import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:contacts_app/contactsPage.dart';

class InfoAdsScreen extends StatelessWidget {
  const InfoAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  "Used Macbook",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Text",
                  style: TextStyle(color: Colors.orange),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Image.asset("images/profile.jfif"),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.person_outline_outlined),
                            Text("Ali"),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.watch_rounded),
                            Text("fecha"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                      "loremasfsdfsd fsd we sdf sdfsd ewf sdf dsf f sdf sdfs dfsd fsd fsd fsd f info"),
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
                      "Contact Seller",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
