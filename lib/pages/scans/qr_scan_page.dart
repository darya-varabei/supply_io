import 'dart:convert';

import '../../model/supply/certificate_model.dart';
import 'package:http/http.dart' as http;

import '../../model/supply/package_model.dart';
import '../../model/supply/product_model.dart';
import '../../model/supply/size_model.dart';
import '../../model/supply/status_model.dart';
import '../../model/supply/weight_model.dart';
import '../../model/user/login_model.dart';

Future<Certificate?> createByPackage(String url) async {
  final Uri apiUrl = Uri.parse("https://192.168.8.138:44335/api/parcer");
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

Future<Certificate?> createByCertificate(String url) async {
  final Uri apiUrl = Uri.parse("https://192.168.8.138:44335/api/parcer");
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
    return Certificate.fromJson(jsonDecode(responseString));
  } else {
    return null;
  }
}


Future<Certificate?> sendUse(String url) async {
  final Uri apiUrl = Uri.parse(
      "https://192.168.8.138:44335/api/parcer/certificate/check");
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