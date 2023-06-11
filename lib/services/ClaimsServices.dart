import 'dart:convert';

import 'package:hackapp/models/claim2.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class claimsServices {
  static Future<List<Claim>> getAllClaims() async {
    String? BASE_URL =
        "http://192.168.4.68:8081/api/v1/springfever/api/user/getClaimsByUser";
    List<Claim> Claims = [];
    final resp = await http.get(Uri.parse(BASE_URL), headers: <String, String>{
      'authorization': 'Bearer ${await storage.read(key: "jwt")}',
    });
    print(resp.body);
    if (resp.statusCode == 200) {
      Claims = ClaimListFromJson(resp.body);
      print("list of claims ::::: $Claims");
    } else {}
    return Claims;
  }

  static Future<void> addClaim(String subject, String desciption) async {
    String dateTimeString = DateTime.now().toString();
    String date = dateTimeString.substring(0, 10);
    final apiUrl =
        'http://192.168.4.68:8081/api/v1/springfever/api/user/AddClaim/';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': 'Bearer ${await storage.read(key: "jwt")}',
        },
        body: jsonEncode({
          "subject": subject,
          "contenu": desciption,
          "dateClaim": date,
         }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        print('Claim added successfully: ${response.statusCode}');
      } else {
        // Error handling if the request fails
        print('Failed to add claim. Error code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception handling
      print('Error during API call: ${e}');
    }
  }
}
