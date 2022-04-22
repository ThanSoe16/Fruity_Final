import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruity/util/Constants.dart';
import 'package:fruity/view/LoginPage.dart';
import 'package:fruity/view/WelcomePage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    Timer(Duration(seconds: 3), () {
      Get.off(isLogin ? WelcomePage() : LoginPage());

    });
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool(Constants().loginStatus)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Image.asset(
          "assets/logo.png",
          width: 200,
        )),
      ),
    ));
  }
}
