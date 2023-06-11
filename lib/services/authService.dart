import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hackapp/Screens/home-adminVersion.dart';
import 'package:hackapp/models/user.dart';
import 'package:http/http.dart' as http;

import '../Screens/home-employeeVersion.dart';

class auth {
  static Future<String> login(
      String username, String password, BuildContext context) async {
    final storage = const FlutterSecureStorage();
    final apiUrl =
        'http://192.168.4.68:8081/api/v1/springfever/api/auth/signinV2';

    // Create the request body
    final body = {
      'username': username,
      'password': password,
    };

    // Encode the body as JSON
    final jsonBody = json.encode(body);

    // Make the POST request
    final response = await http.post(Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'}, body: jsonBody);

    if (response.statusCode == 200) {
      print(response.body);
      // If the request is successful, parse the response JSON

      User u = userFromJson(response.body);

      final jsonResponse = json.decode(response.body);
      dynamic roles = jsonResponse['roles'];
      if (u.roles.contains("Employee")) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else if (u.roles.contains("chef")) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreenAdmin()));
      }
      storage.write(key: 'roles', value: roles.toString());
      final token = jsonResponse['accessToken'];
      return u.accessToken;
    } else {
      // If the request fails, throw an error
      throw Exception('Failed to login');
    }
  }
}
