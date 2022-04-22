import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruity/util/Constants.dart';
import 'package:fruity/view/RegisterPage.dart';
import 'package:fruity/view/WelcomePage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String phone='',pass='';
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    getData();
  }

  getData() async{
    final prefs = await SharedPreferences.getInstance();
    phone = prefs.getString(Constants().phoneStoreData)!;
    pass = prefs.getString(Constants().passwordStoreData)!;
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
                      Text("Login",
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
                      Text("Enter your phone number and password",
                          style: GoogleFonts.sourceSansPro(
                              textStyle:
                                  TextStyle(fontSize: Constants().bodySize))),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
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
                    height: 10,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        child: Text("Forgot Password ?",
                            style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontSize: Constants().bodySize,
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
                    child: Text("Login",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                fontSize: Constants().bodySize,
                                color: Constants().secondaryColor,
                                fontWeight: FontWeight.w700))),
                    onPressed: () async{
                      await EasyLoading.show(
                        status: 'loading...',
                      );
                      if(phoneController.text == '' || passController.text == ''){
                        await EasyLoading.dismiss();
                        await EasyLoading.showError(
                            "Please fill data",
                            dismissOnTap: true);
                      }else{

                        if(phone == phoneController.text && pass == passController.text){
                          await EasyLoading.dismiss();
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool(Constants().loginStatus,true);
                          Get.offAll(WelcomePage());
                          await EasyLoading.showSuccess(
                              "Welcome to Fruity",
                              dismissOnTap: true);

                        }else{
                          await EasyLoading.dismiss();
                          await EasyLoading.showError(
                              "Invalid Login",
                              dismissOnTap: true);
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text("or log in with",
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
                      Text("Don't have an account?",
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  fontSize: Constants().bodySize,
                                  color: Constants().fontColor,
                                  fontWeight: FontWeight.w600))),
                      MaterialButton(
                        onPressed: () {
                          Get.to(RegisterPage());

                        },
                        padding: EdgeInsets.all(0),
                        minWidth: 60,
                        child: Text("Sign Up",
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
