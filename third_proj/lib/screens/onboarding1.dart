import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
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

      body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Lottie.asset('assets/images/food_animation.json'),
              const SizedBox(height: 50),
              

              const Text('Select Your Favorite Food',
                  style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Nunito', fontSize: 14),
                  textAlign: TextAlign.center),

              const Expanded(
                child: Text(
                    'Order your meal anytime, skip the wait, and get it delivered right to your workstation effortlessly!',
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                    textAlign: TextAlign.center),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton( onPressed: (){
                      Navigator.pushNamed(context, '/onboarding2');},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF31B2ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )

                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),  
                        child: const Text('Get Started',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontSize: 18)),
                      ),
                    )
     ])
            ]
      )
      )
      );
  }
}