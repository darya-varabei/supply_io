import 'dart:core';
import 'package:supply_io/model/supply/status_model.dart';
import 'package:supply_io/model/supply/size_model.dart';
import 'package:supply_io/model/supply/weight_model.dart';

class Package {
  final int packageId;
  Status? status;
  final String? namberConsignmentPackage;
  final String? heat;
  final String? batch;
  final String? serialNumber;
  String? grade;
  final String? destination;
  final String? category;
  final XSize? size;
  final Weight? weight;
  final String? notes;
  final String? comment;

  Package({
      required this.packageId,
      this.status,
      this.namberConsignmentPackage,
      this.heat,
      this.batch,
      this.serialNumber,
      this.grade,
      this.category,
      this.destination,
      this.size,
      this.weight,
      this.notes,
      this.comment});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageId: json['packageId'],
      status: Status.unknownToUsable(json['status']),
      namberConsignmentPackage: json['namberConsignmentPackage'],
      heat: json['heat'],
      batch: json['batch'],
      serialNumber: json['serialNumber'],
      grade: json['grade'],
      category: json['category'],
      destination: json['destination'] ?? "",
      size: XSize.fromJson(json['size']),
      weight: Weight.fromJson(json['weight']),
      notes: json['notes'],
      comment: json['comment'],
    );
  }

    Map<String, dynamic> toJson() {
      Map<String, dynamic> map = {

        'packageId': packageId,
        'status': status?.toJson(),
        'heat': heat,
        'batch': batch,
        'serialNumber': serialNumber,
        'grade': grade,
        'category': category,
        'size': size,
        'weight': weight,
        'notes': notes,
        'comment': comment,
      };
      return map;
  }
}