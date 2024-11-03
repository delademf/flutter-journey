import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:third_proj/screens/restsaurant_screen.dart';
// import 'package:second_proj/screens/restaurant_screen.dart';

class RestaurantCard extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final int restaurantId;

  RestaurantCard({required this.restaurantName, required this.restaurantImage, required this.restaurantId});


  @override
  Widget build(BuildContext context) {

    final imageBytes = base64Decode(restaurantImage);

    return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.memory(imageBytes),
      Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: ElevatedButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantScreen(id: restaurantId)));},child:  Text('KFC',style: TextStyle(fontSize: 14,color:Colors.black,fontWeight: FontWeight.w800)))),
        SizedBox(height: 20,),
      ]);
  }
}


Future<bool> getFoodById(
      String id, BuildContext context) async {
    //create uri
    var uri = Uri.parse("https://0b3a-102-176-94-181.ngrok-free.app/user/signUp");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //body
    Map data = {
      'firstName': '$id',
    };
    //convert the above data into json
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");
    print("hello......................................................................................");

    if (response.body.contains('data')) {
      print("BODY CONTAINS DATA");
      Navigator.pushNamed(context, '/dashboard');
    }
    return true;
  }