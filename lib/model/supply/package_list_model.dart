import 'package:flutter/cupertino.dart';
import 'package:supply_io/model/supply/package_model.dart';

class PackageList {
  final String? supplyDate;
  final int packageId;
  final String batch;
  final String grade;
  final String numberOfCertificate;
  final double width;
  final double thickness;
  final int weight;
  final int? mill;
  final String? coatingClass;
  final String? sort;
  final int net;
  final String supplier;
  final int? elongation;
  final int? price;
  final String? comment;
  final List<String>? photo;
  String status;

  PackageList({
    this.supplyDate,
    required this.packageId,
    required this.batch,
    required this.grade,
    required this.numberOfCertificate,
    required this.width,
    required this.thickness,
    required this.weight,
    this.mill,
    this.coatingClass,
    this.sort,
    required this.net,
    required this.supplier,
    this.elongation,
    required this.price,
    this.comment,
    this.photo,
    required this.status,
  });

  factory PackageList.fromJson(Map<String, dynamic> json) {
    return PackageList(
      supplyDate: json['supplyDate'].toString(),
      packageId: json['packageId'],
      batch: json['batch'].toString(),
      grade: json['grade'].toString(),
      numberOfCertificate: json['numberOfCertificate'].toString(),
      width: json["width"].toDouble(),
      thickness: json['thickness'],
      weight: json['weight'],
      mill: json['mill'],
      coatingClass: json['coatingClass'],
      sort: json['sort'].toString(),
      net: json['net'],
      supplier: json['supplier'].toString(),
      elongation: json['elongation'],
      price: json['price'],
      comment: json['comment'].toString(),
      photo: json['photo'],
      status: json['status'].toString(),
    );}
}


abstract class IPackage {
  String? supplyDate;
  String? grade;
  String? batch;
  String? numberOfCertificate;
  String? width;
  String? thickness;
  String? height;
  String? mill;
  String? coatingClass;
  String? sort;
  String? supplier;
  String? elongation;
  String? price;
  String? comment;
  String? status;

  IPackage({
    this.supplyDate,
    this.grade,
    this.numberOfCertificate,
    this.batch,
    this.width,
    this.thickness,
    this.height,
    this.mill,
    this.coatingClass,
    this.sort,
    this.supplier,
    this.elongation,
    this.price,
    this.comment,
    this.status,
  });
}