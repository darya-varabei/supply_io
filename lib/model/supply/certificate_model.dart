import 'dart:convert';
import 'dart:core';

import 'package:supply_io/model/supply/package_model.dart';
import 'package:http/http.dart' as http;

import '../user/login_model.dart';

class Certificate {
  final int certificateId;
  //final List<String>? link;
  final String? number;
  final String? date;
  final String? author;
  final String? authorAddress;
  final String? fax;
  final String? recipient;
  final String? recipientCountry;
  //final Product product;
  final String? shipmentShop;
  final String? wagonNumber;
  final String? orderNumber;
  final String? typeOfRollingStock;
  final String? typeOfPackaging;
  final String? placeNumber;
  final String? gosts;
  final String? notes;
  List<Package> packages;


  Certificate(
      {required this.certificateId,
      //this.link,
      this.number,
      this.date,
      this.author,
      this.authorAddress,
      this.fax,
      this.recipient,
      this.recipientCountry,
     // required this.product,
      this.shipmentShop,
      this.wagonNumber,
      this.orderNumber,
      this.typeOfRollingStock,
      this.typeOfPackaging,
      this.placeNumber,
      this.gosts,
      this.notes,
      required this.packages});

  factory Certificate.fromJson(Map<String, dynamic> json) {
    var list = json['packages'] as List;
    print(list.runtimeType);
    List<Package> imagesList = list.map((i) => Package.fromJson(i)).toList();

    return Certificate(
        certificateId: json['certificateId'],
        //link: json['link'],
        number: json['number'],
        date: json['date'],
        author: json['author'],
        authorAddress: json['authorAddress'],
        fax: json['fax'],
        recipient: json['recipient'],
        recipientCountry: json['recipientCountry'],
        //product: json['product'],
        shipmentShop: json['shipmentShop'],
        wagonNumber: json['wagonNumber'],
        orderNumber: json['orderNumber'],
        typeOfRollingStock: json['typeOfRollingStock'],
        typeOfPackaging: json['typeOfPackaging'],
        placeNumber: json['placeNumber'],
        gosts: json['gosts'],
        notes: json['notes'],
        //packages: json['packages']

        packages: imagesList);//json["packages"] == null ? null : Package.fromJson(json["packages"]));
  }

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
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
