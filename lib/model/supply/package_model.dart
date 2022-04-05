import 'dart:core';
import 'package:flutter/material.dart';
import 'package:supply_io/model/supply/chemical_composition_model.dart';
import 'package:supply_io/model/supply/status_model.dart';
import 'package:supply_io/model/supply/size_model.dart';
import 'package:supply_io/model/supply/weight_model.dart';

class Package {
  final int packageId;
  final String dateAdded;
  final String dateChange;
  final Status status;
  final String namberConsignmentPackage;
  final String heat;
  final String batch;
  final int? orderPosition;
  final int? numberOfClientMaterial;
  final int? serialNumber;
   String? grade;
  final int? category;
  final String? strenghtGroup;
  final String? profile;
  final String? barcode;
  final XSize size;
  final int quantity;
  final String variety;
  final String gost;
  final Weight weight;
  final int? customerItemNumber;
  final String? treatment;
  final int? groupCode;
  final String? pattemCutting;
  final String surfaceQuality;
  final String? rollingAccuracy;
  final String? categoryOfDrawing;
  final String? stateOfMaterial;
  final int? roughtness;
  final int? flatness;
  final String? trimOfEdge;
  final String? weldability;
  final String? orderFeature;
  final ChemicalCompositionModel? chemicalComposition;
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

  Package({
      required this.packageId,
      required this.dateAdded,
      required this.dateChange,
      required this.status,
      required this.namberConsignmentPackage,
      required this.heat,
      required this.batch,
      this.orderPosition,
      this.numberOfClientMaterial,
      this.serialNumber,
      this.grade,
      this.category,
      this.strenghtGroup,
      this.profile,
      this.barcode,
      required this.size,
      required this.quantity,
      required this.variety,
      required this.gost,
      required this.weight,
      this.customerItemNumber,
      this.treatment,
      this.groupCode,
      this.pattemCutting,
      required this.surfaceQuality,
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
      this.comment});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageId: json['packageId'],
      dateAdded: json['dateAdded'],
      dateChange: json['dateChange'],
      status: json['status'],
      namberConsignmentPackage: json['namberConsignmentPackage'],
      heat: json['heat'],
      batch: json['batch'],
      orderPosition: json['orderPosition'],
      numberOfClientMaterial: json['numberOfClientMaterial'],
      serialNumber: json['serialNumber'],
      grade: json['grade'],
      category: json['category'],
      strenghtGroup: json['strenghtGroup'],
      profile: json['profile'],
      barcode: json['barcode'],
      size: json['size'],
      quantity: json['quantity'],
      variety: json['variety'],
      gost: json['gost'],
      weight: json['weight'],
      customerItemNumber: json['customerItemNumber'],
      treatment: json['treatment'],
      groupCode: json['groupCode'],
      pattemCutting: json['pattemCutting'],
      surfaceQuality: json['surfaceQuality'],
      rollingAccuracy: json['rollingAccuracy'],
      categoryOfDrawing: json['categoryOfDrawing'],
      stateOfMaterial: json['stateOfMaterial'],
      roughtness: json['roughtness'],
      flatness: json['flatness'],
      trimOfEdge: json['trimOfEdge'],
      weldability: json['weldability'],
      orderFeature: json['orderFeature'],
      chemicalComposition: json['chemicalComposition'],
      sampleLocation: json['sampleLocation'],
      directOfTestPicses: json['directOfTestPicses'],
      temporalResistance: json['temporalResistance'],
      yieldPoint: json['yieldPoint'],
      tensilePoint: json['tensilePoint'],
      elongation: json['elongation'],
      bend: json['bend'],
      hardness: json['hardness'],
      rockwell: json['rockwell'],
      brinel: json['brinel'],
      eriksen: json['eriksen'],
      impactStrength: json['impactStrength'],
      grainSize: json['grainSize'],
      decarburiization: json['decarburiization'],
      cementite: json['cementite'],
      banding: json['banding'],
      corrosion: json['corrosion'],
      testingMethod: json['testingMethod'],
      unitTemporaryResistance: json['unitTemporaryResistance'],
      unitYieldStrength: json['unitYieldStrength'],
      sphericalHoleDepth: json['sphericalHoleDepth'],
      microBallCem: json['microBallCem'],
      r90: json['r90'],
      n90: json['n90'],
      koafNavodorag: json['koafNavodorag'],
      notes: json['notes'],
      photo: json['photo'],
      comment: json['comment'],
    );
  }
}