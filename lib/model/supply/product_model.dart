class Product {
  final int productId;
  final String name;
  final int? labeling;
  final int? code;

  Product({
    required this.productId,
    required this.name,
    this.labeling,
    this.code});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        productId: json['productId'],
        name: json['name'],
        labeling: json['labeling'],
        code: json['code']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'productId': productId,
      'name': name?.trim(),
      'labeling': labeling,
      'code': code,
    };
    return map;
  }
}