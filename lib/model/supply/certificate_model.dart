
import 'dart:core';

import 'package:supply_io/model/supply/package_model.dart';
import 'package:supply_io/model/supply/product_model.dart';

class Certificate {
  final int certificateId;
  final List<String>? link;
  final String? number;
  final String? date;
  final String? author;
  final String? authorAddress;
  final String? fax;
  final String? recipient;
  final String? recipientCountry;
  final Product? product;
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
      this.link,
      this.number,
      this.date,
      this.author,
      this.authorAddress,
      this.fax,
      this.recipient,
      this.recipientCountry,
        required this.product,
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
    List<Package> imagesList = list.map((i) => Package.fromJson(i)).toList();

    return Certificate(
        certificateId: json['certificateId'],
        link: List<String>.from(json["link"].map((x) => x)),
        number: json['number'],
        date: json['date'],
        author: json['author'],
        authorAddress: json['authorAddress'],
        fax: json['fax'],
        recipient: json['recipient'],
        recipientCountry: json['recipientCountry'],
        product: Product.fromJson(json['product']),
        shipmentShop: json['shipmentShop'],
        wagonNumber: json['wagonNumber'],
        orderNumber: json['orderNumber'],
        typeOfRollingStock: json['typeOfRollingStock'],
        typeOfPackaging: json['typeOfPackaging'],
        placeNumber: json['placeNumber'],
        gosts: json['gosts'],
        notes: json['notes'],
        packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),);

       // packages: imagesList);//json["packages"] == null ? null : Package.fromJson(json["packages"]));
  }
}
