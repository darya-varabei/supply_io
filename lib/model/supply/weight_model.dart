class Weight {
  final int weightId;
  final double gross;
  final double? gross2;
  final double net;

  Weight({
    required this.weightId,
    required this.gross,
    required this.gross2,
    required this.net
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
        weightId: json['weightId'],
        gross: json['gross'],
        gross2: json['gross2'],
        net: json['net']);
  }
}