import 'dart:typed_data';

class Defect {
  int rollId;
  String description;
  List<Uint8List?> defectPhoto;

  Defect({required this.rollId, required this.description, required this.defectPhoto});

  factory Defect.fromJson(Map<String, dynamic> json) {
    return Defect(
        rollId: json['rollId'],
        description: json['description'],
        defectPhoto: json['defectPhoto']
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'packageId': rollId,
      'comment': description.trim(),
      'photo': defectPhoto,
    };

    return map;
  }
}