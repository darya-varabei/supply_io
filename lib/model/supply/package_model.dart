import 'dart:core';
import 'package:flutter/material.dart';
import 'package:supply_io/model/supply/chemical_composition_model.dart';
import 'package:supply_io/model/supply/status_model.dart';
import 'package:supply_io/model/supply/size_model.dart';
import 'package:supply_io/model/supply/weight_model.dart';

class Package {
  final int packageId;
  final DateTime dateAdded;
  final DateTime dateChange;
  final Status status;
  final String namberConsignmentPackage;
  final String heat;
  final String batch;
  final int? orderPosition;
  final int? numberOfClientMaterial;
  final int? serialNumber;
  final String? grade;
  final int? category;
  final String? strenghtGroup;
  final String? profile;
  final String? barcode;
  final Size size;
  final int quantity;
  final String variety;
  final String gost;
  final Weight weight;
  final int? customerItemNumber;
  final String? treatment;
  final int? groupCode;
  final String? patternCutting;
  final String surfaceQuality;
  final String? rollingAccuracy;
  final String? categoryOfDrawing;
  final String? stateOfMaterial;
  final int? roughtness;
  final int? flatness;
  final String? trimOfEdge;
  final String? weldability;
  final String? orderFeature;
  final ChemicalCompositionModel chemicalComposition;
  final int? sampleLocation;
  final int? directOfTestPicses;
  final int? temporalResistance;
  final int? yieldPoint;
  final int? tensilePoint;
  final int? elongation;
  final int? bend;
  final int? hardness;
  final int? rockwell;
  final int? brinel;
  final int? eriksen;
  final int? impactStrength;
  final int? grainSize;
  final int? decarburiization;
  final int? cementite;
  final int? banding;
  final String? corrosion;
  final String? testingMethod;
  final int? unitTemporaryResistance;
  final int? unitYieldStrength;
  final double? sphericalHoleDepth;
  final int? microBallCem;
  final int? r90;
  final int? n90;
  final int? koafNavodorag;
  final int? notes;
  final Image? photo;
  final String? comment;

  Package(
      this.packageId,
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
      this.strenghtGroup,
      this.profile,
      this.barcode,
      this.size,
      this.quantity,
      this.variety,
      this.gost,
      this.weight,
      this.customerItemNumber,
      this.treatment,
      this.groupCode,
      this.patternCutting,
      this.surfaceQuality,
      this.rollingAccuracy,
      this.categoryOfDrawing,
      this.stateOfMaterial,
      this.roughtness,
      this.flatness,
      this.trimOfEdge,
      this.weldability,
      this.orderFeature,
      this.chemicalComposition,
      this.sampleLocation,
      this.directOfTestPicses,
      this.temporalResistance,
      this.yieldPoint,
      this.tensilePoint,
      this.elongation,
      this.bend,
      this.hardness,
      this.rockwell,
      this.brinel,
      this.eriksen,
      this.impactStrength,
      this.grainSize,
      this.decarburiization,
      this.cementite,
      this.banding,
      this.corrosion,
      this.testingMethod,
      this.unitTemporaryResistance,
      this.unitYieldStrength,
      this.sphericalHoleDepth,
      this.microBallCem,
      this.r90,
      this.n90,
      this.koafNavodorag,
      this.notes,
      this.photo,
      this.comment);
}