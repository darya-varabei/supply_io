class Literals {

  static const String scanQRTitle = "Добавление рулона";
  static const String scanCertificateTitle = 'Для регистрации рулона нажмите кнопку "Сканировать" и наведите на QR код на этикетке рулона или сертификате. В случае получения результата в виде списка рулонов, выберите необходимый по идентификатору на этикетке и продолжите работу. ';
  static const String scanQRStory = "Добавление сертификата";
  static const String scanCertificateStory = 'Для регистрации сертификата для сохранения рулонов в будущем, отсканируйте QR код на сертификате. В дальнейшем для сохранения рулона на складе выиберите рулн из списка на вкладке "Сертификаты в ожидании".';
}

class Endpoint {
  static const String baseUrl = "https://parcer-dotnet.herokuapp.com/api/";
  static const String login = "authentication/login";
  static const String getCertificates = "parcer/package";
  static const String addCertificate = "parcer";
  static const String savePackage = "parcer/package/";
  static const String useByLink = "parcer/certificate/check";
  static const String getPackage = "parcer/package";
  static const String getPackagesInUse = "parcer/package";
  static const String saveDefect = "parcer/package/defect";
}