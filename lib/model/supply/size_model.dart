class XSize {
  int sizeId;
  double thickness;
  int width;
  double length;

  XSize({
      required this.sizeId,
    required this.thickness,
    required this.width,
    required this.length });

  factory XSize.fromJson(Map<String, dynamic> json) {
    return XSize(
        sizeId: json['sizeId'],
        thickness: json['thickness'],
        width: json['width'],
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