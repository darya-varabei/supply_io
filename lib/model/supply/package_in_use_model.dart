class PackageInUseModel {
  String? supplyDate;
  int? packageId;
  String? grade;
  String? batch;
  String? numberOfCertificate;
  double? width;
  int? weight;
  double? thickness;
  String? height;
  String? mill;
  int? net;
  String? coatingClass;
  String? sort;
  String? supplier;
  String? elongation;
  String? price;
  String? comment;
  String? photo;
  String? status;

  PackageInUseModel({
  this.supplyDate,
    this.packageId,
  this.grade,
  this.numberOfCertificate,
    this.batch,
    this.weight,
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

  factory PackageInUseModel.fromJson(Map<String, dynamic> json) {
    return PackageInUseModel(
        supplyDate: json['supplyDate'].toString(),
      packageId: json['packageId'],
        grade: json['grade'].toString(),
        numberOfCertificate: json['numberOfCertificate'].toString(),
        batch: json['batch'].toString(),
        width: json["width"].toDouble(),
      weight: json["weight"],
        thickness: json['thickness'],
        height: json['height'].toString(),
        mill: json['mill'].toString(),
        coatingClass: json['coatingClass'].toString(),
        sort: json['sort'].toString(),
        supplier: json['supplier'].toString(),
        elongation: json['elongation'].toString(),
        price: json['price'].toString(),
      comment: json['comment'].toString(),
      status: json['status'].toString(),
    );}
}