import 'dart:core';
import 'package:supply_io/model/supply/status_model.dart';
import 'package:supply_io/model/supply/size_model.dart';
import 'package:supply_io/model/supply/weight_model.dart';

class Package {
  final int packageId;
  final String? dateAdded;
  final String? dateChange;
  Status? status;
  final String? namberConsignmentPackage;
  final String? heat;
  final String? batch;
  final int? orderPosition;
  final String? numberOfClientMaterial;
  final String? serialNumber;
  String? grade;
  final String? destination;
  final String? category;
  final String? strenghtGroup;
  final XSize? size;
  final int? quantity;
  final String? variety;
  final Weight? weight;
  final String? treatment;
  final int? groupCode;
  final String? notes;
  final String? comment;

  Package({
      required this.packageId,
      this.dateAdded,
      this.dateChange,
      this.status,
      this.namberConsignmentPackage,
      this.heat,
      this.batch,
      this.orderPosition,
      this.numberOfClientMaterial,
      this.serialNumber,
      this.grade,
      this.category,
      this.destination,
      this.strenghtGroup,
      this.size,
      this.quantity,
      this.variety,
      this.weight,
      this.treatment,
      this.groupCode,
      this.notes,
      this.comment});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageId: json['packageId'],
      dateAdded: json['dateAdded'],
      dateChange: json['dateChange'],
      status: Status.unknownToUsable(json['status']),
      namberConsignmentPackage: json['namberConsignmentPackage'],
      heat: json['heat'],
      batch: json['batch'],
      orderPosition: json['orderPosition'],
      numberOfClientMaterial: json['numberOfClientMaterial'],
      serialNumber: json['serialNumber'],
      grade: json['grade'],
      category: json['category'],
      strenghtGroup: json['strenghtGroup'],
      destination: json['destination'] ?? "",
      size: XSize.fromJson(json['size']),
      quantity: json['quantity'],
      variety: json['variety'],
      weight: Weight.fromJson(json['weight']),
      treatment: json['treatment'],
      groupCode: json['groupCode'],
      notes: json['notes'],
      comment: json['comment'],
    );
  }

    Map<String, dynamic> toJson() {
      Map<String, dynamic> map = {

        'packageId': packageId,
        'dateAdded': dateAdded,
        'dateChange': dateChange,
        'status': status?.toJson(),
        'heat': heat,
        'batch': batch,
        'orderPosition': orderPosition,
        'numberOfClientMaterial': numberOfClientMaterial,
        'serialNumber': serialNumber,
        'grade': grade,
        'category': category,
        'strenghtGroup': strenghtGroup,
        'size': size,
        'variety': variety,
        'weight': weight,
        'treatment': treatment,
        'groupCode': groupCode,
        'notes': notes,
        'comment': comment,
      };
      return map;
  }
}