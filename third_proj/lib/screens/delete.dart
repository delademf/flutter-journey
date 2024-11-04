 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


Future<bool> deleteUser(
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    // Create the URI
    var uri = Uri.parse("https://c8aa-196-61-37-18.ngrok-free.app/user/delete-user/$userId");

    Map<String, String> headers = {"Content-Type": "application/json"};


    print("deleting.....");

    var response = await http.post(uri, headers: headers);
    print(response.body);

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    // Check the response
    // if (parsedJson['responseCode'] == "000") {
    //   print(parsedJson['responseCode']);
    //   print("BODY CONTAINS DATA");
    //   print(parsedJson);
    //   Navigator.pushNamed(context, '/loginScreen');
    //   return true;
    // } else {
    //   print('Failed with response code: ${response.statusCode}');
    //   return false;
    // }

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/sign_up_page');
    }

    return true;
  }