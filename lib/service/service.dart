import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:supply_io/helpers/literals.dart';
import 'package:supply_io/model/user/user_model.dart';
import 'package:supply_io/pages/scans/add/package_list_parameters.dart';

import '../model/defect_model.dart';
import '../model/supply/certificate_model.dart';
import '../model/supply/package_list_model.dart';
import '../model/supply/package_model.dart';
import '../model/user/login_model.dart';
import 'package:http/http.dart' as http;

class Service {

  static Future<Map<String, String>?> header() async {
    String token = "";
    UserData? userData = await getJwtOrEmpty();
    String? tokenBase = userData?.accessToken;
    if (tokenBase != null) {
      token = tokenBase;
    }
    return {
    'Content-Type': 'application/json; charset=UTF-8',
    'access_Token': token
    };
  }

  static Future<UserData?> getJwtOrEmpty() async {
    var accessToken = await storage.read(key: "access_token");
    var refreshToken = await storage.read(key: "refresh_token");
    if (accessToken == null) {
      return null;
    } else {
      UserData userData = UserData(
          accessToken: accessToken, refreshToken: refreshToken);
      return userData;
    }
  }

  static Future<int> saveDefect(Defect defect, List<File> images) async {
    final Uri apiUrl = Uri.parse('${Endpoint.baseUrl}${Endpoint.saveDefect}');
    if (images.isNotEmpty && defect.description.isNotEmpty) {
      for (var i = 0; i < images.length; i++) {
        List<int> imageBytes = images[i].readAsBytesSync();
        defect.defectPhoto.add(Uint8List.fromList(imageBytes));
      }
    }

    final body = json.encode(defect.toJson());

    final response = await http.put(apiUrl,
        headers: await header(),
        body: body);
    return response.statusCode;
  }

  static Future<Certificate?> createByPackage(String url) async {
    final Uri apiUrl = Uri.parse(
        "${Endpoint.baseUrl}${Endpoint.addCertificate}");

    final msg = jsonEncode({"link": url});
    final response = await http.post(apiUrl, headers: await header(), body: msg);
    if (response.statusCode < 400) {
      final String responseString = response.body;
      return Certificate.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }

  static Future<bool> checkIfUserLogged() async {
    UserData? userData = await getJwtOrEmpty();
    if (userData?.accessToken == null) {
      return false;
    }
    final Uri apiUrl = Uri.parse(
        "${Endpoint.baseUrl}${Endpoint.checkIfLoggedIn}");
    final response = await http.get(apiUrl, headers: await header());
    if (response.statusCode < 400) {
    return true;
    } else {
      return false;
    }
  }

  static Future<Certificate?> createByCertificate(String url) async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.addCertificate}");

    final msg = jsonEncode({"link":url});
    final response = await http.post(apiUrl, headers: await header(), body: msg);
    if (response.statusCode < 400) {
      final String responseString = response.body;
      final certificate = Certificate.fromJson(jsonDecode(responseString));
      return certificate;
    } else {
      return null;
    }
  }

  static Future<Certificate?> sendUseByLink(String url) async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.useByLink}");

    final msg = jsonEncode({"link":url});
    final response = await http.post(apiUrl, headers: await header(), body: msg);
    if (response.statusCode < 400) {
      final String responseString = response.body;
      final certificate = Certificate.fromJson(jsonDecode(responseString));
      //if ()certificate.packages.count == 1)
      return certificate;
    } else {
      return null;
    }
  }

  static Future<int?> sendUseById(String batch) async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.savePackage}");

    final msg = jsonEncode({"batch":batch,
    "status": "В обработке"});
    final response = await http.put(apiUrl, headers: await header(), body: msg);
    if (response.statusCode < 400) {
      return response.statusCode;
    } else {
      return null;
    }
  }

  static Future<int?> savePackageFromWait(String batch) async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.changeStatus}");

    final msg = jsonEncode({"batch":batch,
      "status": "Имеется"});
    final response = await http.put(apiUrl, headers: await header(), body: msg);
    if (response.statusCode < 400) {
      return response.statusCode;
    } else {
      return null;
    }
  }

  static Future<int> savePackage(Package result, int certificateNumber) async {
    final Uri apiUrl = Uri.parse('${Endpoint.baseUrl}${Endpoint.savePackage}$certificateNumber');
    String body = json.encode(result.toJson());
    final response = await http.post(apiUrl,
        headers: await header(),
        body: body);
    return response.statusCode;
  }

  static Future<int> savePackageToWait(Package result, int certificateNumber) async {
    final Uri apiUrl = Uri.parse('${Endpoint.baseUrl}${Endpoint.savePackage}$certificateNumber');
    String body = json.encode(result.toJson());
    final response = await http.post(apiUrl,
        headers: await header(),
        body: body);
    return response.statusCode;
  }

  static Future<List<PackageList>> getPackagesInUse() async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.getInStock}?status=В%20обработке");
    final response = await http.get(apiUrl, headers: await header());

    if (response.statusCode < 400) {
      List<PackageList>? listDecoded = [];
      listDecoded = (json.decode(response.body) as List).map((i) =>
          PackageList.fromJson(i)).toList();
      return listDecoded;
    } else {
      return List.empty();
    }
  }

  static Future<Future<int?>?> definePackageListAction(PackageListMode mode, PackageList package) async {
    switch(mode) {
      case PackageListMode.inWait:
        return savePackageFromWait(package.batch);
      case PackageListMode.inUse:
        return sendUseById(package.batch);
      case PackageListMode.inProduction:
        return null;
    }
  }

  static Future<List<PackageList>> getCertificatesInWait() async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.getInStock}?status=В%20ожидании");
    final response = await http.get(apiUrl, headers: await header());

    if (response.statusCode < 400) {
      List<PackageList>? listDecoded = [];
      listDecoded = (json.decode(response.body) as List).map((i) =>
          PackageList.fromJson(i)).toList();
      return listDecoded;
    } else {
      return List.empty();
    }
  }

  static Future<List<PackageList>> getPackagesInStock() async {
    final Uri apiUrl = Uri.parse("${Endpoint.baseUrl}${Endpoint.getInStock}?status=Имеется");

    final response = await http.get(apiUrl, headers: await header());

    if (response.statusCode < 400) {
      List<PackageList>? listDecoded = [];
      listDecoded = (json.decode(response.body) as List).map((i) =>
          PackageList.fromJson(i)).toList();
      return listDecoded;
    } else {
      return List.empty();
    }
  }
}