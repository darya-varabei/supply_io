import 'dart:core';

import 'package:supply_io/model/supply/package_model.dart';
import 'package:supply_io/model/supply/product_model.dart';

class Certificate {
  final int certificateId;
  final String link;
  final String number;
  final DateTime date;
  final String author;
  final String authorAddress;
  final String? fax;
  final String? recipient;
  final String recipientCountry;
  final Product product;
  final String shipmentShop;
  final String wagonNumber;
  final String orderNumber;
  final String typeOfRollingStock;
  final String? typeOfPackaging;
  final String? placeNumber;
  final String? gosts;
  final String? notes;
  final List<Package> packages;

  Certificate(
      this.certificateId,
      this.link,
      this.number,
      this.date,
      this.author,
      this.authorAddress,
      this.fax,
      this.recipient,
      this.recipientCountry,
      this.product,
      this.shipmentShop,
      this.wagonNumber,
      this.orderNumber,
      this.typeOfRollingStock,
      this.typeOfPackaging,
      this.placeNumber,
      this.gosts,
      this.notes,
      this.packages);
}