import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:supply_io/helpers/literals.dart';
import 'package:http/http.dart' as http;
import 'package:supply_io/model/supply/package_list_model.dart';
import 'package:supply_io/model/user/login_model.dart';
import 'package:supply_io/model/user/user_model.dart';
import 'package:supply_io/service/service.dart';

Future<void> main() async {
  final Uri apiUrl = Uri.parse('${Endpoint.baseUrl}${Endpoint.login}');
  UserData userData = UserData();
  final response1 = await http.post(apiUrl, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
      body: jsonEncode(<String, String>{
        'login': 'admin',
        'password': 'admin'
      }));

  Map<String, dynamic> responseMap = json.decode(response1.body);
  if (response1.statusCode < 300) {
    userData.addData(responseMap);
    storage.write(key: "access_token", value: userData.accessToken);
    storage.write(key: "refresh_token", value: userData.refreshToken);
  }
  group('Counter', () {
    test('Список со статутсом "В ожидании"', () {
      List<PackageList> futureData = [];
      Service.getCertificatesInWait().then((certificatesFromServer) {
          futureData = certificatesFromServer;
      });
      expect(futureData, isNotEmpty);
    });

    test('Список со статусом "Имеется"', () {
      List<PackageList> futureData = [];
      Service.getPackagesInStock().then((certificatesFromServer) {
        futureData = certificatesFromServer;
      });
      expect(futureData, isNotEmpty);
    });

    test('Список со статусом "В обработке"', () {
      List<PackageList> futureData = [];
      Service.getPackagesInUse().then((certificatesFromServer) {
        futureData = certificatesFromServer;
      });
      expect(futureData, isNotEmpty);
    });
  });
}