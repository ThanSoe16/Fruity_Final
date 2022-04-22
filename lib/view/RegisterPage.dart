import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruity/view/LoginPage.dart';
import 'package:fruity/view/WelcomePage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/Constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool _passwordVisible = true;
  bool _confirmPassWordVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
    _confirmPassWordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 150,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Sign Up",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().titleSize,
                                  color: Constants().primaryColor,
                                  fontWeight: FontWeight.w600))),
                      SizedBox(
                          height: 80,
                          child: Image.asset(
                            "assets/duo.png",
                            width: 40,
                            alignment: Alignment.topLeft,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Enter your credentials to continue",
                          style: GoogleFonts.sourceSansPro(
                              textStyle:
                                  TextStyle(fontSize: Constants().bodySize))),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///UserName Field///
                  Row(
                    children: [
                      Text("Username",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().bodySize,
                                  color: Colors.grey))),
                    ],
                  ),
                  TextFormField(
                    cursorColor: Constants().primaryColor,
                    controller: userNameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ///Phone Number Field///
                  Row(
                    children: [
                      Text("Phone Number",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().bodySize,
                                  color: Colors.grey))),
                    ],
                  ),
                  TextFormField(
                    cursorColor: Constants().primaryColor,
                    decoration: InputDecoration(
                      fillColor: Constants().primaryColor,
                      prefixText: '+95 ',
                    ),
                    controller: phoneController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  ///Password Field///
                  Row(
                    children: [
                      Text("Password",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().bodySize,
                                  color: Colors.grey))),
                    ],
                  ),
                  TextFormField(
                    obscureText: _passwordVisible,
                    controller: passController,
                    cursorColor: Constants().primaryColor,
                    decoration: InputDecoration(
                        fillColor: Constants().primaryColor,
                        focusColor: Constants().primaryColor,
                        suffixIconColor: Colors.grey,
                        hoverColor: Constants().primaryColor,
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ///Confirm Password Field///
                  Row(
                    children: [
                      Text("Confirm Password",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().bodySize,
                                  color: Colors.grey))),
                    ],
                  ),
                  TextFormField(
                    obscureText: _confirmPassWordVisible,
                    controller: confirmPassController,
                    cursorColor: Constants().primaryColor,
                    decoration: InputDecoration(
                        fillColor: Constants().primaryColor,
                        focusColor: Constants().primaryColor,
                        suffixIconColor: Colors.grey,
                        hoverColor: Constants().primaryColor,
                        suffixIcon: IconButton(
                          icon: Icon(_confirmPassWordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _confirmPassWordVisible = !_confirmPassWordVisible;
                            });
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (val) {},
                        focusColor: Constants().primaryColor,
                      ),
                      Text("Agree our ",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().subBodySize,
                                  color: Colors.grey))),
                      MaterialButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        child: Text("Terms of Service",
                            style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontSize: Constants().subBodySize,
                                    color: Constants().fontColor,
                                    fontWeight: FontWeight.w600))),
                      ),
                      Text(" & ",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().subBodySize,
                                  color: Colors.grey))),
                      MaterialButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        child: Text("Privacy Policy",
                            style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontSize: Constants().subBodySize,
                                    color: Constants().fontColor,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Constants().primaryColor,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    height: 42,
                    child: Text("Sign Up",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                fontSize: Constants().bodySize,
                                color: Constants().secondaryColor,
                                fontWeight: FontWeight.w700))),
                    onPressed: () async{
                      await EasyLoading.show(
                        status: 'loading...',
                      );
                      if(userNameController.text == '' || phoneController.text == '' || phoneController.text.length < 9 || passController.text == '' || confirmPassController.text == ''){
                        await EasyLoading.dismiss();
                        await EasyLoading.showError(
                            "Please fill data",
                            dismissOnTap: true);
                      }else{
                        if(passController.text == confirmPassController.text){
                          await EasyLoading.dismiss();
                          print("success");
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString(Constants().userNameStoreData,userNameController.text.trim());
                          await prefs.setString(Constants().phoneStoreData,phoneController.text.trim());
                          await prefs.setString(Constants().passwordStoreData,passController.text.trim());
                          Get.offAll(LoginPage());


                        }else{
                          await EasyLoading.dismiss();
                          await EasyLoading.showError(
                              "Passwords does not match",
                              dismissOnTap: true);

                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text("or sign up with",
                      style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              fontSize: Constants().bodySize,
                              color: Constants().fontColor,
                              fontWeight: FontWeight.w600))),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          MaterialButton(
                            color: Constants().primaryColor,
                            minWidth: 35,
                            height: 35,
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/google.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Google",
                              style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      fontSize: Constants().bodySize,
                                      color: Constants().fontColor,
                                      fontWeight: FontWeight.w700))),
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                              color: Constants().primaryColor,
                              minWidth: 35,
                              height: 35,
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {},
                              child: Icon(
                                Icons.facebook,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Facebook",
                              style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      fontSize: Constants().bodySize,
                                      color: Constants().fontColor,
                                      fontWeight: FontWeight.w700))),
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            color: Constants().primaryColor,
                            minWidth: 35,
                            height: 35,
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/apple.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Apple ID",
                              style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      fontSize: Constants().bodySize,
                                      color: Constants().fontColor,
                                      fontWeight: FontWeight.w700))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Already have an account?",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().bodySize,
                                  color: Constants().fontColor,
                                  fontWeight: FontWeight.w600))),
                      MaterialButton(
                        onPressed: () {Get.to(LoginPage());},
                        padding: EdgeInsets.all(0),
                        minWidth: 60,
                        child: Text("Sign In",
                            style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontSize: Constants().bodySize,
                                    color: Constants().primaryColor,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
