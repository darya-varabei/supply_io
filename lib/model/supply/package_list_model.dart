
class PackageList {
  final String? supplyDate;
  final int packageId;
  final String batch;
  final String? grade;
  final String? numberOfCertificate;
  final double? width;
  final double? thickness;
  final double? weight;
  final String? destination;
  final String? coatingClass;
  final String? sort;
  final double? net;
  final String? supplier;
  final String? comment;
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
    this.coatingClass,
    this.sort,
    this.net,
    this.supplier,
    this.comment,
    required this.status,
  });

  factory PackageList.fromJson(Map<String, dynamic> json) {
    return PackageList(
      supplyDate: json['supplyDate'].toString(),
      packageId: json['packageId'],
      batch: json['batch'].toString(),
      grade: json['grade'].toString(),
      numberOfCertificate: json['numberOfCertificate'].toString(),
      width: (json["width"] ?? 0)*1.0,
      thickness: (json['thickness'] ?? 0)*1.0,
      weight: (json['weight'] ?? 0)*1.0,
      destination: json['destination'] ?? "",
      coatingClass: json['coatingClass'],
      sort: json['sort'].toString(),
      net: (json['net'] ?? 0)*1.0,
      supplier: json['supplier'].toString(),
      comment: json['comment'].toString(),
      status: json['status'].toString(),
    );}
}