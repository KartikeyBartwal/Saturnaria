import 'dart:async';
import 'main.dart';

import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  late BuildContext myContext;

  @override
  Widget build(BuildContext context) {
    myContext = context; // Store the context during the build method

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/image/splashScreenBg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/nekiLogo.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      callMainScreen();
    });
  }

  void callMainScreen() {
    Navigator.pushReplacement(
      myContext,
      MaterialPageRoute(
        builder: (context) {
          return const LogPage();
        },
      ),
    );
  }
}
