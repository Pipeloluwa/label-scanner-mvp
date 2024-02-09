import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:label_scanner_mvp/pages/scan_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode user_focus = FocusNode();
  FocusNode password_focus = FocusNode();
  ValueNotifier<bool> isFocused = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user_focus.addListener(() {
      checkFocus();
    });
    password_focus.addListener(() {
      checkFocus();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    user_focus.dispose();
    isFocused.dispose();
  }

  void checkFocus() {
    user_focus.hasFocus || password_focus.hasFocus
        ? isFocused.value = true
        : isFocused.value = false;
  }

  void login() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => ScanImage()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        body: Container(
            color: Colors.white,
            alignment: Alignment.topCenter,
            child: ListView(
                //I AM SETTING THE PADDING TOP  TO ZERO HERE SO THE FIRST ELEMENT IN THE LIS WILL START FROM THERE BECAUSE LIST COMES WITH ALREADY PREBUILT PADDING VALUE(S)
                padding: EdgeInsets.only(top: 0),
                children: [

                  Transform.scale(
                    scale: 1.0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              // alignment: Alignment.bottomCenter,
                              child: ClipPath(
                                // clipper: WaveClipperTwo(reverse: true),
                                clipper: WaveClipperTwo(),
                                child: Container(
                                  height: 500,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.indigo.shade900,
                                            Colors.blueAccent.shade700
                                          ])),
                                ),
                              ),
                            ),


                            const Positioned(
                                top: 40,
                                right: 0,
                                child: Opacity(
                                    opacity: 0.5,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/20240126_131120_0000.png"),
                                      height: 90,
                                      width: 90,
                                    ))),
                            const Positioned(
                                top: 120,
                                right: -50,
                                child: Opacity(
                                    opacity: 0.5,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/20240126_131120_0000.png"),
                                      height: 300,
                                      width: 300,
                                    ))),
                            const Positioned(
                                top: 340,
                                right: 300,
                                child: Opacity(
                                    opacity: 0.5,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/20240126_131120_0000.png"),
                                      height: 120,
                                      width: 120,
                                    ))),
                            Positioned(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 60, bottom: 8, left: 20),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Expanded(
                                    child: Text("User Login",
                                        textScaler: TextScaler.noScaling,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // alignment: Alignment.bottomCenter,
                      child: Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 0, top: 80.0),
                          child: Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Expanded(
                                child: Column(
                                  children: [
                                    TextField(
                                      // onTap: (){isFocused_();},
                                      // onTapOutside: (event){FocusScope.of(context).unfocus();},
                                      focusNode: user_focus,

                                      decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                              color: Colors.blueAccent),
                                          label: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person_2_rounded,
                                                color: Colors.blueAccent,
                                              ),
                                              Expanded(
                                                  child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Expanded(
                                                    child: Text(
                                                  "Username",
                                                  textScaler:
                                                      TextScaler.noScaling,
                                                )),
                                              ))
                                            ],
                                          )),
                                    ),
                                    TextField(
                                      // onTap: (){isFocused_();},
                                      // onTapOutside: (event){FocusScope.of(context).unfocus();},
                                      focusNode: password_focus,

                                      obscureText: true,
                                      decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                              color: Colors.blueAccent),
                                          label: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.lock,
                                                color: Colors.blueAccent,
                                              ),
                                              Expanded(
                                                  child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Expanded(
                                                    child: Text(
                                                  "Password",
                                                  textScaler:
                                                      TextScaler.noScaling,
                                                )),
                                              ))
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 8.0, bottom: 20.0, top: 50.0),
                            child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.indigo),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                  elevation: MaterialStatePropertyAll(4.0),
                                  shadowColor:
                                      MaterialStatePropertyAll(Colors.black),
                                ),
                                onPressed: () {
                                  login();
                                },
                                child: Expanded(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.0),
                                      child: Expanded(
                                          child: Text(
                                        "LOGIN",
                                        style: TextStyle(fontSize: 18),
                                        textScaler: TextScaler.noScaling,
                                      ))),
                                )),
                          ),
                        ),
                      ),
                    ],
                  )
                ])),

      ),
    );
  }
}
