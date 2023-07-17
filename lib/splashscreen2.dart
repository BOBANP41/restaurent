import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ipix_mechine_test/homepage.dart';
import 'package:lottie/lottie.dart';

class splashtwo extends StatefulWidget {
  const splashtwo({super.key});

  @override
  State<splashtwo> createState() => _splashtwoState();
}

class _splashtwoState extends State<splashtwo> {
   @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => hompage()),
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
              child: Lottie.asset("assets/animation_lk5rhduk.json")
            )
          ],
        ),
      ),

    );
  }
}