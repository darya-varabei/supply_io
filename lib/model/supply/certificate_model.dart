import 'dart:convert';
import 'dart:core';

import 'package:supply_io/model/supply/package_model.dart';
import 'package:supply_io/model/supply/product_model.dart';
import 'package:http/http.dart' as http;

import '../user/login_model.dart';

class Certificate {
  final int certificateId;
  final String link;
  final String number;
  final String date;
  final String author;
  final String authorAddress;
  final String? fax;
  final String? recipient;
  final String recipientCountry;
  final Product product;
  final String shipmentShop;
  final String wagonNumber;
  final String orderNumber;
  final String typeOfRollingStock;
  final String? typeOfPackaging;
  final String? placeNumber;
  final String? gosts;
  final String? notes;
  final List<Package> packages;

  Certificate( {
      required this.certificateId,
    required this.link,
    required this.number,
    required this.date,
    required this.author,
    required this.authorAddress,
      this.fax,
      this.recipient,
    required this.recipientCountry,
    required this.product,
    required this.shipmentShop,
    required this.wagonNumber,
    required this.orderNumber,
    required this.typeOfRollingStock,
      this.typeOfPackaging,
      this.placeNumber,
      this.gosts,
      this.notes,
    required this.packages});

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
        certificateId: json['certificateId'],
        link: json['link'],
        number: json['number'],
        date: json['date'],
        author: json['author'],
        authorAddress: json['authorAddress'],
        fax: json['fax'],
        recipient: json['recipient'],
        recipientCountry: json['recipientCountry'],
        product: json['product'],
        shipmentShop: json['shipmentShop'],
        wagonNumber: json['wagonNumber'],
        orderNumber: json['orderNumber'],
        typeOfRollingStock: json['typeOfRollingStock'],
        typeOfPackaging: json['typeOfPackaging'],
        placeNumber: json['placeNumber'],
        gosts: json['gosts'],
        notes: json['notes'],
        packages: json['packages']
    );
  }

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if(jwt == null) return "";
    return jwt;
  }

  Future<Certificate> createAlbum(String link) async {
    String token = await getJwtOrEmpty();
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'access_token': token,
        },
      body: jsonEncode(<String, String>{
        'link': link,
      }),
    );

    if (response.statusCode == 201) {
      return Certificate.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to create album.');
    }
  }
}