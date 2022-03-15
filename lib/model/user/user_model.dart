class _LoginData {
  String email = '';
  String password = '';
}

class UserData extends _LoginData {
  String token = '';
  String username = '';
  int id = 0;

  void addData (Map<String, dynamic> responseMap) {
    this.id = responseMap["id"];
    this.username = responseMap["username"];
    this.token = responseMap["token"];
  }
}
