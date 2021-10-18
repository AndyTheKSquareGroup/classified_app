import 'package:classifiedapp/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _fullNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _mobileNumberCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: 277,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      //BRAND
                      Align(
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.asset(
                            "images/background.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Image.asset("images/logo.png"),
                        ),
                      )
                    ],
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
                        controller: _fullNameCtrl,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Full Name",
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
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email Address",
                        ),
                      ),
                    ),
                    // USER PHONE
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _mobileNumberCtrl,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Mobile Number",
                        ),
                      ),
                    ),
                    //PASSWORD
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: TextField(
                        controller: _passwordCtrl,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                      ),
                    ),
                    //BUTTON CREATE ACCOUNT
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          // Get.to(LoginScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            primary: Colors.deepOrange),
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),

                //GO TO LOGIN SCREEN
                TextButton(
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                  child: Text(
                    "Already have an account?",
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
