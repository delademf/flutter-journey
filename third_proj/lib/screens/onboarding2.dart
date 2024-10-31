import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
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
              Lottie.asset('assets/images/food_animation3.json',
                height: 250, width: 250, fit: BoxFit.cover),
              const SizedBox(height: 50),
              

              const Text('Order, Relax, Enjoy Delivery',
                  style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Nunito', fontSize: 14),
                  textAlign: TextAlign.center),

              const Expanded(
                child: Text(
                    'Busy day? Order now and enjoy quick delivery straight to your desk, no lines, no hassle',
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                    textAlign: TextAlign.center),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton( onPressed: (){
                      Navigator.pushNamed(context, '/onboarding3');},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF31B2ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )

                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: const Text('Next',
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