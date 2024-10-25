class Weight {
  final int? weightId;
  double? gross;
  double? net;

  Weight({
    this.weightId,
    this.gross,
    this.net
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
        weightId: json['weightId'],
        gross: json['gross']*1.0,
        net: json['net']*1.0);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'weightId': weightId,
      'gross': gross,
      'net': net,
    };
    return map;
  }
}