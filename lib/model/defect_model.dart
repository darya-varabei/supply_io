import 'dart:ui';

import 'package:flutter/material.dart';

class Defect {
  String rollId;
  String description;
  FileImage defectPhoto;

  Defect({required this.rollId, required this.description, required this.defectPhoto});

  factory Defect.fromJson(Map<String, dynamic> json) {
    return Defect(
        rollId: json['rollId'],
        description: json['description'],
        defectPhoto: json['defectPhoto']
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'rollId': rollId.trim(),
      'description': description.trim(),
      'defectPhoto': defectPhoto,
    };

    return map;
  }
}