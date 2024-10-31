import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:third_proj/screens/dashboard.dart';
import 'package:third_proj/screens/logIn_screen.dart';
import 'package:third_proj/screens/onboarding1.dart';
import 'package:third_proj/screens/signup_screen.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
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
            const SizedBox(height: 80),
            Image.asset('assets/images/pic1.png',
                height: 300, width: 300, fit: BoxFit.cover),
            const SizedBox(height: 120),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0xFF31B2ED),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       ElevatedButton( onPressed: (){
                  //         Navigator.pushNamed(context, '/onboarding2');},
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Color(0xFF31B2ED),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //           )

                  //         ),
                  //         child: const Text('Log In  ',
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.w700,
                  //                 fontFamily: 'Nunito',
                  //                 color: Colors.white,
                  //                 fontSize: 18)),
                  //       )
                  //      ]),
                  SizedBox(height: 40),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 10)),
                        ),
                        child: Text(
                          "Sign Up ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Nunito',
                              fontSize: 18,
                              color: Color(0xFF31B2ED)),
                        )),
                  ]),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 10)),
                        ),
                        child: Text(
                          "Log In    ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Nunito',
                              fontSize: 18,
                              color: Color(0xFF31B2ED)),
                        )),
                  ]),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Or Sign In with",
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
                  SizedBox(height: 50)
                ],
              ),
            )
          ]),
        ));
  }
}
