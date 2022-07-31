class Account {
  String username;
  String name;
  String surname;
  String email;
  String position;

  Account(
      {required this.username,
      required this.name,
      required this.surname,
      required this.email,
      required this.position});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      username: json['username'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      position: json['position']
    );
  }
}
