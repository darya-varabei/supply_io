class PackageCut {
  final int packageId;
  final String batch;
  final String? grade;
  final String? numberOfCertificate;
  final double? width;
  final double? thickness;
  final double? weight;
  final String? destination;
  final double? net;
  final String? supplier;
  String status;
  final String cutDate;
  final int ribbonWidth;
  final int numOfRibbons;

  PackageCut({
    required this.packageId,
    required this.batch,
    this.destination,
    this.grade,
    this.numberOfCertificate,
    this.width,
    this.thickness,
    this.weight,
    this.net,
    this.supplier,
    required this.status,
    required this.cutDate,
    required this.ribbonWidth,
    required this.numOfRibbons,
  });

  factory PackageCut.fromJson(Map<String, dynamic> json) {
    return PackageCut(
      packageId: json['packageId'],
      batch: json['batch'].toString(),
      grade: json['grade'].toString(),
      numberOfCertificate: json['numberOfCertificate'].toString(),
      width: json["width"].toDouble(),
      thickness: json['thickness'] * 1.0,
      weight: json['weight'] * 1.0,
      destination: json['destination'] ?? "",
      net: json['net'] * 1.0,
      supplier: json['supplier'].toString(),
      status: json['status'].toString(),
      cutDate: json['cutDate'].toString(),
      ribbonWidth: json['ribbonWidth'],
      numOfRibbons: json['numOfRibbons'],
    );}
}