import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';
import 'package:third_proj/helper/constant.dart';
import 'package:third_proj/models/signup_model.dart';

class ApiService {
  Future<void> authenticate(String email, String password) async {
    var uri = Uri.parse(baseUrl);
    Map data = {
      'email': email,
      'password': password,
    };
    //convert the above data into json
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);
    print("this is the response");
    print(response);
    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    if (parsedJson['data'] != null) {
      var data = parsedJson['data']; // Access the 'data' object
      var userId = data['id']; // Retrieve the 'id' field from 'data'
      var email = data['email'];

      // Print the ID for debugging
      print("User ID: $userId");
      Logger().d(
          "££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££");

      // // Store the user ID in SharedPreferences for access in other pages
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setInt('userId', userId);
      // await prefs.setString('email', email);
    }

    //print the response body
    print("${response.body}");
    Logger().d(
        "hello......................................................................................");

    if (response.body.contains('data')) {
      print("BODY CONTAINS DATA");
      // Navigator.pushNamed(context, '/Mainscreen');
    }
  }

  Future<void> signUp(SignUpModel signUpmodel) async {
    var uri = Uri.parse(baseUrl);
    var response =
        await http.post(uri, headers: headers, body: signUpmodel.toJson());
    print("this is the response");
    print(response);

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    if (parsedJson['data'] != null) {
      var data = parsedJson['data']; // Access the 'data' object
      var userId = data['id']; // Retrieve the 'id' field from 'data'
      var email = data['email'];

      // Print the ID for debugging
      print("User ID: $userId");
      Logger().d(")");
    }
  }
}
