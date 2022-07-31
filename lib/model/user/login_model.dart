
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();


class LoginResponseModel {
  final String? token;
  final String? error;

  LoginResponseModel({
    this.token,
    this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}