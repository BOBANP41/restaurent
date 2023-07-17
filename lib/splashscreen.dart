import 'package:flutter/material.dart';
import 'package:ipix_mechine_test/homepage.dart';
import 'package:ipix_mechine_test/loginpage.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
   void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isLoggedIn ? hompage() : Login(),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset("assets/LsZ9bTcoK1.json"),
            )
          ],
        ),
      ),
    );
  }
}


