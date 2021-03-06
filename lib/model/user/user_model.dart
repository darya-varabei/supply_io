class _LoginData {
  String email = '';
  String password = '';
}

class UserData extends _LoginData {
  String? accessToken = '';
  String? refreshToken = '';

  UserData({
    this.accessToken,
    this.refreshToken
  });

  void addData (Map<String, dynamic> responseMap) {
    this.accessToken = responseMap["accessToken"];
    this.refreshToken = responseMap["refreshToken"];
  }
}
