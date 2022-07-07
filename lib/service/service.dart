import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:supply_io/helpers/literals.dart';

import '../model/defect_model.dart';
import '../model/supply/certificate_model.dart';
import '../model/supply/package_model.dart';
import '../model/user/login_model.dart';
import 'package:http/http.dart' as http;

class Service {

  static Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  static Future<int> saveDefect(Defect defect, List<File> images) async {
    String token = await getJwtOrEmpty();
    final Uri apiUrl =
    Uri.parse('${Endpoint.baseUrl}${Endpoint.saveDefect}');
    if (images.isNotEmpty && defect.description.isNotEmpty) {
      for (var i = 0; i < images.length; i++) {
        List<int> imageBytes = images[i]!.readAsBytesSync();
        String base64Image = base64Encode(imageBytes);
        defect.defectPhoto.add(Uint8List.fromList(imageBytes));
      }
    }

    final response = await http.put(apiUrl,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(defect.toJson()));
    return response.statusCode;
  }

  static Future<Certificate?> createByPackage(String url) async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.addCertificate}");
    var tokenBase = await storage.read(key: "jwt");
    String token = "";
    if (tokenBase != null) {
      token = tokenBase;
    } else {
      return null;
    }
    final msg = jsonEncode({"link":url});
    final response = await http.post(apiUrl, headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    }, body: msg);
    if (response.statusCode < 400) {
      final String responseString = response.body;
      print(responseString);
      return Certificate.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }

  static Future<Certificate?> createByCertificate(String url) async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.addCertificate}");
    var tokenBase = await storage.read(key: "jwt");
    String token = "";
    if (tokenBase != null) {
      token = tokenBase;
    } else {
      return null;
    }
    final response = await http.post(apiUrl, headers: {
      "Content-Type": "application/json",
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

  static Future<Certificate?> sendUseByLink(String url) async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.useByLink}");
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

  static Future<Certificate?> sendUseById(String url) async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.savePackage}");
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

  static Future<int> savePackage(Package result, int certificateNumber) async {
    String token = "";
    final Uri apiUrl = Uri.parse('${SERVER_IP}/api/parcer/package/${certificateNumber}');
    String body = json.encode(result.toJson());
    final response = await http.post(apiUrl,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(result.toJson()));
    return response.statusCode;
  }

  static Future<int> usePackage(Package packageToUse) async {
    String token = await getJwtOrEmpty();
    final Uri apiUrl = Uri.parse("${SERVER_IP}/api/parcer/package?batch=${packageToUse.batch}&status=2");
    final response = await http.put(apiUrl);
    return response.statusCode;
  }

  static Future<List<Certificate>> getPackagesInUse() async {
    final Uri apiUrl = Uri.parse("${Endpoint.useByLink}${Endpoint.useByLink}?status=В%20обработке");
    String token = await getJwtOrEmpty();
    final response = await http.get(apiUrl, headers: {
      'access_token': token,
    });

    if (response.statusCode < 400) {
      final String responseString = response.body;
      var packageList = jsonDecode(responseString);
      List<Certificate>? listDecoded = [];
      listDecoded = (json.decode(response.body) as List).map((i) =>
          Certificate.fromJson(i)).toList();
      return listDecoded;
    } else {
      return List.empty();
    }
  }

  static Future<List<Package>> getPackagesInStock() async {
    final Uri apiUrl = Uri.parse("${Endpoint.useByLink}${Endpoint.useByLink}?status=Имеется");
    String token = await getJwtOrEmpty();
    final response = await http.get(apiUrl, headers: {
      'access_token': token,
    });

    if (response.statusCode < 400) {
      final String responseString = response.body;
      var packageList = jsonDecode(responseString);
      List<Package>? listDecoded = [];
      listDecoded = (json.decode(response.body) as List).map((i) =>
          Package.fromJson(i)).toList();
      return listDecoded;
    } else {
      return List.empty();
    }
  }
}