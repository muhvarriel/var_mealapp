import 'package:flutter/material.dart';
import 'dart:async';
import 'package:var_mealapp/main_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 150,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/logo.png"))),
      )),
    );
  }
}
