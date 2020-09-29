import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:todeay/authenticate/googleauthen.dart';
import 'package:todeay/screens/LoginScreen.dart';
import 'package:todeay/screens/tasks_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    navigateuser();
  }

  navigateuser() {
    User currentser = SignIn().auth.currentUser;

    if (currentser != null) {
      Timer(
          Duration(seconds: 1),
          () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TaskScreen(
                      currentser, SignIn().googleSignIn, SignIn().auth)),
              (Route<dynamic> route) => false));
    } else {
      Timer(
          Duration(seconds: 1),
          () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (Route<dynamic> route) => false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back2.jpeg'),
          ),
        ),
      ),
    );
  }
}
