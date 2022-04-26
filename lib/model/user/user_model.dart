class _LoginData {
  String email = '';
  String password = '';
}

class UserData extends _LoginData {
  String accessToken = '';
  String refreshToken = '';
  //int id = 0;

  void addData (Map<String, dynamic> responseMap) {
    //this.id = responseMap["id"];
    this.accessToken = responseMap["accessToken"];
    this.refreshToken = responseMap["refreshToken"];
  }
}
