import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruity/util/Constants.dart';
import 'package:fruity/view/LoginPage.dart';
import 'package:fruity/view/RegisterPage.dart';
import 'package:fruity/view/SplashScreen.dart';
import 'package:fruity/view/WelcomePage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
  configLoading();
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fruity",

      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightGreen,

        fontFamily: 'Source Sans Pro',
      ),
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}

