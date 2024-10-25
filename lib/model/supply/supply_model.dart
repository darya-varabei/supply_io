import 'dart:convert';

SupplyLinkModel supplyLinkModelFromJson(String str) => SupplyLinkModel.fromJson(json.decode(str));

String supplyLinkModelToJson(SupplyLinkModel data) => json.encode(data.toJson());

class SupplyLinkModel {
  String url = "";

  SupplyLinkModel({
    this.url = ""
  });

  factory SupplyLinkModel.fromJson(Map<String, dynamic> json) => SupplyLinkModel(
      url: json["url"]
  );

  Map<String, dynamic> toJson() => {
    "url": url
  };
}