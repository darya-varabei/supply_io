class Weight {
  final int? weightId;
  double? gross;
  final double? gross2;
  double? net;

  Weight({
    this.weightId,
    this.gross,
    this.gross2,
    this.net
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
        weightId: json['weightId'],
        gross: json['gross'],
        gross2: json['gross2'],
        net: json['net']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'weightId': weightId,
      'gross': gross,
      'gross2': gross2,
      'net': net,
    };
    return map;
  }
}