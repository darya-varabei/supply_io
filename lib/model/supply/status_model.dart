class Status {
  int? statusId;
  String? statusName;

  Status({
      this.statusId,
      this.statusName});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
        statusId: json['statusId'],
        statusName: json['statusName']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'statusId': statusId,
      'statusName': statusName,
    };
    return map;
  }
}