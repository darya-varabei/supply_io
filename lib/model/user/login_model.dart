import 'package:http/http.dart' as http;
import 'dart:convert' show json, base64, ascii;

// const SERVER_IP = 'http://192.168.1.167:5000';
// final storage = FlutterSecureStorage();


class LoginResponseModel {
  final String? token;
  final String? error;

  LoginResponseModel({
    this.token,
    this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email?.trim(),
      'password': password?.trim(),
    };

    return map;
  }

  // Future<String?> attemptLogIn(String username, String password) async {
  //   var res = await http.post(
  //       "$SERVER_IP/login",
  //       body: {
  //         "username": username,
  //         "password": password
  //       }
  //   );
  //   if(res.statusCode == 200) return res.body;
  //   return null;
  // }

}