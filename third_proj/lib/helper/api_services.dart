import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';
import 'package:third_proj/helper/constant.dart';
import 'package:third_proj/models/login_res_model.dart';
import 'package:third_proj/models/signup_model.dart';

class ApiService {
  Future<dynamic> authenticate(String email, String password) async {
    var uri = Uri.parse("$baseUrl/user/login");
    Map data = {
      'email': email,
      'password': password,
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);
    Map<String, dynamic> parsedJson = jsonDecode(response.body);
    Logger().d(parsedJson);
    return parsedJson;
  }

  Future<dynamic> signUp(SignUpModel signUpmodel) async {
    var uri = Uri.parse("$baseUrl/user/signUp");
    var response = await http.post(uri,
        headers: headers, body: jsonEncode(signUpmodel.toJson()));
    print("this is the response");
    Map<String, dynamic> parsedJson = jsonDecode(response.body);
    Logger().d(parsedJson);
    return parsedJson;
  }
}
