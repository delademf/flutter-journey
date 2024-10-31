import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third_proj/helper/api_services.dart';
import 'package:third_proj/main.dart';
import 'package:third_proj/screens/dashboard.dart';
import 'package:third_proj/screens/main_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 24))
              ],
            )),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/images/ecl_logo.png',
            ),
            Text(
              "Food Service",
              style: TextStyle(
                  color: Color(0xFF31B2ED),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 80),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0xFF31B2ED),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text('Log In ',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontSize: 18)),
                      )
                    ]),

                    /////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                        controller: emailTextEditingController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "name@example.com",
                        )),
                    const SizedBox(height: 22),
                    /////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password")),
                    const SizedBox(height: 22),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      //

                      ElevatedButton(
                        onPressed: () {
                          context.read<ApiService>().authenticate(
                              emailTextEditingController.text,
                              passwordTextEditingController.text);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 90, vertical: 10),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF31B2ED)),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                      ),
                    ]),

                    //          ElevatedButton(onPressed: (){
                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MainScreen()),);
                    //  }, style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white),shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal:90,vertical: 10)),
                    // ),
                    // child:
                    //   Text(" Log In    ",style: TextStyle(fontWeight: FontWeight.w700,fontFamily: 'Nunito',fontSize: 18,color:Color(0xFF31B2ED)),)
                    // ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Or Log In with",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/ic_google.png"),
                        Icon(
                          Icons.facebook_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.apple,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 105)
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
