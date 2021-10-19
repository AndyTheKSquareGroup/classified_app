import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:classifiedapp/views/admin/home_view.dart';
import 'package:classifiedapp/views/auth/register_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //BRAND
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 277,
                    width: double.infinity,
                    child: Stack(
                      children: [
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
                      // EMAIL
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                      // PASSWORD
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: TextField(
                          controller: _passwordCtrl,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                        ),
                      ),
                      // BUTTON ENTER TO APP
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(HomeScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              primary: Colors.deepOrange),
                          child: const Text(
                            "Login",
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
                      Get.to(const SingUpScreen());
                    },
                    child: Text(
                      "Don't have any account?",
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
      ),
    );
  }
}
