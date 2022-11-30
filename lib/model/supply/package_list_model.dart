
class PackageList {
  final String? supplyDate;
  final int packageId;
  final String batch;
  final String? grade;
  final String? numberOfCertificate;
  final double? width;
  final double? thickness;
  final double? weight;
  final int? mill;
  final String? destination;
  final String? coatingClass;
  final String? sort;
  final double? net;
  final String? supplier;
  final int? elongation;
  final int? price;
  final String? comment;
  final List<String>? photo;
  String status;

  PackageList({
    this.supplyDate,
    this.destination,
    required this.packageId,
    required this.batch,
    this.grade,
    this.numberOfCertificate,
    this.width,
    this.thickness,
    this.weight,
    this.mill,
    this.coatingClass,
    this.sort,
    this.net,
    this.supplier,
    this.elongation,
    this.price,
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
      thickness: json['thickness']*1.0,
      weight: json['weight']*1.0,
      destination: json['destination'] ?? "",
      mill: json['mill'],
      coatingClass: json['coatingClass'],
      sort: json['sort'].toString(),
      net: json['net']*1.0,
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