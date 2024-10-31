import 'package:flutter/material.dart';
import 'package:third_proj/screens/onboarding1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override 
  void initState(){
    super.initState();
    redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/ecl_logo.png"),
            Text("Food Service",style: TextStyle(color: Color(0xFF31B2ED),fontSize: 20,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
  Future<void> redirect() async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const  Onboarding1(),
      )
    );
  }
}