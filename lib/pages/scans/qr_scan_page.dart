import 'dart:convert';

import '../../model/supply/certificate_model.dart';
import 'package:http/http.dart' as http;

import '../../model/supply/package_model.dart';
import '../../model/supply/product_model.dart';
import '../../model/supply/size_model.dart';
import '../../model/supply/status_model.dart';
import '../../model/supply/weight_model.dart';
import '../../model/user/login_model.dart';

Future<Certificate?> createUser(String url) async {
  final Uri apiUrl = Uri.parse("https://192.168.100.11:44335/api/parcer");
  var tokenBase = await storage.read(key: "jwt");
  String token = "";
  if (tokenBase != null) {
    token = tokenBase;
  } else {
    return null;
  }
  final response = await http.post(apiUrl, headers: {
    'access_token': token,
  }, body: {
    "link": url
  });
  if (response.statusCode < 400) {
    final String responseString = response.body;
    print(responseString);
    return Certificate.fromJson(jsonDecode(responseString));
  } else {
    return null;
  }
}


Future<Certificate?> sendUse(String url) async {
  final Uri apiUrl = Uri.parse("https://192.168.100.11:44335/api/parcer");
  var tokenBase = await storage.read(key: "jwt");
  String token = "";
  if (tokenBase != null) {
    token = tokenBase;
  } else {
    return null;
  }
  /*final response = await http.post(apiUrl, headers: {
    'access_token': token,
  }, body: {
    "link": url
  });
  if (response.statusCode > 400) {
    final String responseString = response.body;*/
    //print(responseString);
    return Certificate(
      certificateId: 1,
      link: "",
      number: "56327",
      date: "14.01.2022",
      author: "",
      authorAddress: "",
      fax: "",
      recipient: "",
      recipientCountry: "",
     /* product: Product(
          productId: 1,
          name: "ggg",
          labeling: 1,
          code: 2),*/
      shipmentShop: "",
      wagonNumber: "",
      orderNumber: "4",
      typeOfRollingStock: "1",
      typeOfPackaging: "",
      placeNumber: "",
      gosts: "",
      notes: "",
      packages: [
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162486-2",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162486-3",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162487-2",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162487-3",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162487-4",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162489-2",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162489-3",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162489-4",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162490-2",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        ),
        Package(
          packageId: 1,
          dateAdded: "",
          dateChange: "",
          status: Status(statusId: 1, statusName: ''),
          namberConsignmentPackage: "",
          heat: "",
          batch: "8162486-4",
          size: XSize(
              sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
          quantity: 1,
          variety: "",
          gost: "",
          grade: "08Ю",
          weight: Weight(
              weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200),
          surfaceQuality: "",
        )
      ],
    );//Certificate.fromJson(jsonDecode(responseString));
  // } else {
  //   return null;
  // }
}
