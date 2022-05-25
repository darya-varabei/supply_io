class PackageInUseModel {
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

  PackageInUseModel({
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

  factory PackageInUseModel.fromJson(Map<String, dynamic> json) {
    return PackageInUseModel(
        supplyDate: json['supplyDate'].toString(),
        grade: json['grade'].toString(),
        numberOfCertificate: json['numberOfCertificate'].toString(),
        batch: json['batch'].toString(),
        width: json["width"].toString(),
        thickness: json['thickness'].toString(),
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