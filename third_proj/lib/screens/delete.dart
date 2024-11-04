 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:third_proj/helper/constant.dart';


Future<bool> deleteUser(
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    // Create the URI
    var uri = Uri.parse("$baseUrl/user/delete-user/$userId");

    Map<String, String> headers = {"Content-Type": "application/json"};


  
    var response = await http.post(uri, headers: headers);
    Logger().d(response.body);

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    
    Logger().d("deleting........................................");
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/signUp');
    }

    return true;
  }