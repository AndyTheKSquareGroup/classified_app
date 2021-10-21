import 'package:classifiedapp/views/admin/edit_ads_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myAdsScreen extends StatefulWidget {
  const myAdsScreen({Key? key}) : super(key: key);
  @override
  _myAdsScreenState createState() => _myAdsScreenState();
}

class _myAdsScreenState extends State<myAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ads"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Get.to(EditAdsScreen(null));
            },
            child: Text("Go to Edi Ad Screen"),
          ),
        ],
      ),
    );
  }
}
