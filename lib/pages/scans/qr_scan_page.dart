
import 'dart:convert';

import '../../model/supply/certificate_model.dart';
import '../../model/supply_model.dart';
import 'package:http/http.dart' as http;

Future<Certificate?> createUser(String url) async {
  final Uri apiUrl = Uri.parse("http://localhost:56488");

  final response = await http.post(apiUrl, body: {
    "link": url
  });

  if(response.statusCode == 200) {
    final String responseString = response.body;
print(responseString);
    return Certificate.fromJson(jsonDecode(responseString));//supplyLinkModelFromJson(responseString);
  } else {
    return null;
  }
}
