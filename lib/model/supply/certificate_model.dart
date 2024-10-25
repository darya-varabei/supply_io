
import 'dart:core';

import 'package:supply_io/model/supply/package_model.dart';

class Certificate {
  final int certificateId;
  final List<String>? link;
  final String? number;
  final String? date;
  final String? author;
  List<Package> packages;


  Certificate(
      {required this.certificateId,
      this.link,
      this.number,
      this.date,
      this.author,
      required this.packages});

  factory Certificate.fromJson(Map<String, dynamic> json) {
    var list = json['packages'] as List;

    return Certificate(
        certificateId: json['certificateId'],
        link: List<String>.from(json["link"].map((x) => x)),
        number: json['number'],
        date: json['date'],
        author: json['author'],
        packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),);
  }
}
