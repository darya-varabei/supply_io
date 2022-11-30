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

  static Status unknownToUsable(Map<String, dynamic>? value) {
    if (value == null) {
      return Status(statusId: 1, statusName: "В ожидании");
    }
    return Status(
        statusId: value['statusId'],
        statusName: value['statusName']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'statusId': statusId,
      'statusName': statusName,
    };
    return map;
  }
}