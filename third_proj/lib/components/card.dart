import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  final String name;
  final String image;
  final int id;
  final String price;


  GeneralCard({required this.name, required this.image, required this.id,required this.price});


  @override
  Widget build(BuildContext context) {

    final imageBytes = base64Decode(image);

    return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.memory(imageBytes),
      Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: ElevatedButton(onPressed: (){ Navigator.pushNamed(context, '/restaurant');},child:  Text('KFC',style: TextStyle(fontSize: 14,color:Colors.black,fontWeight: FontWeight.w800)))),
        SizedBox(height: 20,),
      ]);
  }
}



