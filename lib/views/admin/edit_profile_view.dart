import 'package:classifiedapp/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameUser = TextEditingController(text: "Andy");
  TextEditingController _emailCtrl =
      TextEditingController(text: "example@gmail.com");
  TextEditingController _mobileCtrl = TextEditingController(text: "92432423");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //BRAND
                Container(
                  padding: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jfif"),
                  ),
                ),

                // FORM
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // USER NAME
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _nameUser,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    // USER EMAIL
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _emailCtrl,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    // USER NUMBER
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _mobileCtrl,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
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
                          "Update Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),

                // CREATE NEW ACCOUNT
                TextButton(
                  onPressed: () {
                    // Get.to(const SingUpScreen());
                  },
                  child: Text(
                    "Loguot",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
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
