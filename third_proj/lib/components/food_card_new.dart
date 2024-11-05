import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:third_proj/helper/constant.dart';

class FoodCardNew extends StatelessWidget {
  final int id;
  final String name;
  final String image; // Base64 encoded image`
  final String price;
  final int? quantity;

  FoodCardNew(
      {required this.name,
      required this.image,
      required this.id,
      required this.price,
      required this.quantity});

  // const FoodCard({super.key});

  Future<bool> getFoodById(int id, BuildContext context) async {
    var uri = Uri.parse("$baseUrl/food/find-by-id/$id");

    Map<String, String> headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: headers);

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    if (parsedJson['responseCode'] == "000") {
      print(parsedJson['responseCode']);
      print("BODY CONTAINS DATA");
      print(parsedJson);
      Navigator.pushNamed(context, '/foodScreen');
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final imageBytes = base64Decode(image);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.memory(
          imageBytes,width: 130,height: 130,
        ),
        ElevatedButton(
          onPressed: () {
            getFoodById(id, context);
          },style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF31B2ED),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
        
                    ),
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              // Text(
              //   quantity.toString(),
              //   style: TextStyle(
              //       fontSize: 17,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
          ],
        )
      ],
    );
  }
}
