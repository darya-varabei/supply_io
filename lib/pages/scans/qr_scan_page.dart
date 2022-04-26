import 'dart:convert';

import '../../model/supply/certificate_model.dart';
import 'package:http/http.dart' as http;

import '../../model/user/login_model.dart';

Future<Certificate?> createUser(String url) async {
  final Uri apiUrl = Uri.parse("https://192.168.100.11:44335/api/parcer");
  var tokenBase = await storage.read(key: "jwt");
  String token = "";
  if (tokenBase != null) {
    token = tokenBase;
  } else {
    return null;
  }
  final response = await http.post(apiUrl, headers: {
    'access_token': token,
  }, body: {
    "link": url
  });
  if (response.statusCode < 400) {
    final String responseString = response.body;
    print(responseString);
    return Certificate.fromJson(jsonDecode(responseString));
  } else {
    return null;
  }
}


Future<Certificate?> sendUse(String url) async {
  final Uri apiUrl = Uri.parse("https://192.168.100.11:44335/api/parcer");
  var tokenBase = await storage.read(key: "jwt");
  String token = "";
  if (tokenBase != null) {
    token = tokenBase;
  } else {
    return null;
  }
  final response = await http.post(apiUrl, headers: {
    'access_token': token,
  }, body: {
    "link": url
  });
  if (response.statusCode < 400) {
    final String responseString = response.body;
    print(responseString);
    return Certificate.fromJson(jsonDecode(responseString));
  } else {
    return null;
  }
}
