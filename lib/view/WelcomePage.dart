
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruity/util/Constants.dart';
import 'package:fruity/view/LoginPage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {


  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().secondaryColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Image.asset("assets/salve.png"),
              const SizedBox(height: 50,),
              Stack(

                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 50, bottom: 30),
                          child: Image.asset(
                            "assets/teri.png",
                            width: 35,
                            alignment: Alignment.topLeft,
                          )),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome to ",
                            style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontSize: Constants().titleSize,
                                    color: Constants().fontColor,
                                    fontWeight: FontWeight.w700))),
                        Text("Fruity",
                            style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontSize: Constants().titleSize,
                                    color: Constants().primaryColor,
                                    fontWeight: FontWeight.w700))),

                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),

              Text("Buy groceries easily with us",
                  style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          fontSize: Constants().bodySize,
                          color: Constants().fontColor,
                          fontWeight: FontWeight.w500))),
              const SizedBox(height: 30,),

              MaterialButton(
                minWidth: MediaQuery.of(context).size.width/1.1,
                color: Constants().primaryColor,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                height: 44,
                child: Text("Get Started",
                    style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            fontSize: Constants().bodySize,
                            color: Constants().secondaryColor,
                            fontWeight: FontWeight.w700))),
                onPressed: () async{
                  await EasyLoading.show(
                    status: 'loading...',
                  );
                  final prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  await EasyLoading.dismiss();
                  Get.offAll(LoginPage());
                },
              ),

            ],
          ),

        ),
      ),
    );
  }
}
