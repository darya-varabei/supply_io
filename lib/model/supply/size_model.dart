class Size {
  final int sizeId;
  final double thickness;
  final int width;
  final double length;

  Size({
      required this.sizeId,
    required this.thickness,
    required this.width,
    required this.length});

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
        sizeId: json['sizeId'],
        thickness: json['thickness'],
        width: json['width'],
        length: json['length']);
  }
}