import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:third_proj/screens/main_screen.dart';

class Successful extends StatefulWidget {
  const Successful({super.key});

  @override
  State<Successful> createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     title: const Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         const Text('',
      //             style: TextStyle(
      //                 fontFamily: 'Nunito',
      //                 fontWeight: FontWeight.w700,
      //                 color: Colors.black,
      //                 fontSize: 24))
      //       ],
      //     )),

      body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Lottie.asset("assets/images/delivery.json", height: 300,width: 300),
              const SizedBox(height: 50),
              

              const Text('Order Completed',
                  style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Nunito', fontSize: 20),
                  textAlign: TextAlign.center),

              const Expanded(
                child: Text(
                  '''
The driver is on the way with your order! 🎉

Get ready for delivery soon—thanks for choosing us! 📦💨''',
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                    textAlign: TextAlign.center),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton( onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const MainScreen()));},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF31B2ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )

                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),  
                        child: const Text('Done',
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