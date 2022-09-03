class XSize {
  int? sizeId;
  double? thickness;
  double? width;
  String? length;

  XSize({
    this.sizeId,
    this.thickness,
    this.width,
    this.length });

  factory XSize.fromJson(Map<String, dynamic> json) {
    return XSize(
        sizeId: json['sizeId'],
        thickness: json['thickness']?.toDouble(),
        width: json['width']?.toDouble(),
        length: json['length']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'sizeId': sizeId,
      'thickness': thickness,
      'width': width,
      'length': length,
    };
    return map;
  }
}