import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
              children: [
                Container(
                      width: 400,
                      height: 500,
                      child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(5.630676975294035, -0.02492537841025456),
                        zoom: 12,
                      ),),
                    ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF31B2ED))
                  ,child: IconButton(onPressed:(){
                    Navigator.pushNamed(context, "/Mainscreen");
                  }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,))),
                ),
              ],
            ),
    );
  }
}