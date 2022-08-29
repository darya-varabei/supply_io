import 'dart:core';
import 'package:supply_io/model/supply/chemical_composition_model.dart';
import 'package:supply_io/model/supply/package_list_model.dart';
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
  final String? category;
  final String? strenghtGroup;
  final String? profile;
  final String? barcode;
  final XSize? size;
  final int? quantity;
  final String? variety;
  final String? gost;
  final Weight? weight;
  final int? customerItemNumber;
  final String? treatment;
  final int? groupCode;
  final String? pattemCutting;
  final String? surfaceQuality;
  final String? rollingAccuracy;
  final String? categoryOfDrawing;
  final String? stateOfMaterial;
  final String? roughtness;
  final String? flatness;
  final String? trimOfEdge;
  final String? weldability;
  final String? orderFeature;
  final ChemicalCompositionModel? chemicalComposition;
  final String? sampleLocation;
  final String? directOfTestPicses;
  final int? temporalResistance;
  final String? yieldPoint;
  final String? tensilePoint;
  final int? elongation;
  final String? bend;
  final String? hardness;
  final String? rockwell;
  final String? brinel;
  final String? eriksen;
  final int? impactStrength;
  final String? grainSize;
  final String? decarburiization;
  final String? cementite;
  final String? banding;
  final String? corrosion;
  final String? testingMethod;
  final String? unitTemporaryResistance;
  final String? unitYieldStrength;
  final double? sphericalHoleDepth;
  final int? microBallCem;
  final int? r90;
  final int? n90;
  final int? koafNavodorag;
  final String? notes;
  //final List<List<>>? photo;
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
      this.pattemCutting,
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
      //this.photo,
      this.comment});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageId: json['packageId'],
      dateAdded: json['dateAdded'],
      dateChange: json['dateChange'],
      status: Status(statusId: 1, statusName: "Имеется"),//Status.fromJson(json['status']),
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
      size: XSize.fromJson(json['size']),
      quantity: json['quantity'],
      variety: json['variety'],
      gost: json['gost'],
      weight: Weight.fromJson(json['weight']),
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
      chemicalComposition: ChemicalCompositionModel.fromJson(json['chemicalComposition']),
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
      //photo: json['photo'],
      comment: json['comment'],
    );
  }

    Map<String, dynamic> toJson() {
      Map<String, dynamic> map = {

        'packageId': packageId,
        'dateAdded': dateAdded,
        'dateChange': dateChange,
        'status': status?.toJson(),
        'namberConsignmentPackage': namberConsignmentPackage,
        'heat': heat,
        'batch': batch,
        'orderPosition': orderPosition,
        'numberOfClientMaterial': numberOfClientMaterial,
        'serialNumber': serialNumber,
        'grade': grade,
        'category': category,
        'strenghtGroup': strenghtGroup,
        'profile': profile,
        'barcode': barcode,
        'size': size,
        //'quantity': quantity,
        'variety': variety,
        'gost': gost,
        'weight': weight,
        'customerItemNumber': customerItemNumber,
        'treatment': treatment,
        'groupCode': groupCode,
        'pattemCutting': pattemCutting,
        'surfaceQuality': surfaceQuality,
        'rollingAccuracy': rollingAccuracy,
        'categoryOfDrawing': categoryOfDrawing,
        'stateOfMaterial': stateOfMaterial,
        'roughtness': roughtness,
        'flatness': flatness,
        'trimOfEdge': trimOfEdge,
        'weldability': weldability,
        'orderFeature': orderFeature,
        'chemicalComposition': chemicalComposition?.toJson(),
        'sampleLocation': sampleLocation,
        'directOfTestPicses': directOfTestPicses,
        'temporalResistance': temporalResistance,
        'yieldPoint': yieldPoint,
        'tensilePoint': tensilePoint,
        'elongation': elongation,
        'bend': bend,
        'hardness': hardness,
        'rockwell': rockwell,
        'brinel': brinel,
        'eriksen': eriksen,
        'impactStrength': impactStrength,
        'grainSize': grainSize,
        'decarburiization': decarburiization,
        'cementite': cementite,
        'banding': banding,
        'corrosion': corrosion,
        'testingMethod': testingMethod,
        'unitTemporaryResistance': unitTemporaryResistance,
        'unitYieldStrength': unitYieldStrength,
        'sphericalHoleDepth': sphericalHoleDepth,
        'microBallCem': microBallCem,
        'r90': r90,
        'n90': n90,
        'koafNavodorag': koafNavodorag,
        'notes': notes,
        //'photo': photo,
        'comment': comment,
      };
      return map;
  }
}