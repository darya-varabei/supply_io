import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';
import 'package:supply_io/model/supply/certificate_model.dart';
import '../../../helpers/animated_items/progressHUD.dart';
import '../../../helpers/literals.dart';
import '../../../service/service.dart';
import '../../lists/scan_result_list.dart';
import '../../sidebar_new/navigation_drawer.dart';

enum ScanOptions {
  certificate,
  package,
  undefined
}

class MainPage extends StatefulWidget {
  ScanOptions scanOption = ScanOptions.undefined;
  MainPage(this.scanOption, {Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState(scanOption: scanOption);
}

class _MainPageState extends State<MainPage> {
  String qrCode = 'Unknown';
  bool isApiCallProcess = false;
  late Certificate result;
  ScanOptions scanOption = ScanOptions.undefined;

  _MainPageState({required this.scanOption});

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _uiSetup(BuildContext context) {
    return
      Scaffold(
      key: _scaffoldKey,
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      scanOption == ScanOptions.package ? Literals.scanQRTitle : Literals.scanQRStory,
                      style: TextStyle(
                          fontSize: 24,
                          color: AppTheme.colors.darkGradient,
                          fontWeight: FontWeight.w500),
                    ))),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                child: Text(
                    scanOption == ScanOptions.package ? Literals.scanCertificateTitle : Literals.scanCertificateStory,
                    style: const TextStyle(fontSize: 14))),
            FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              onPressed: () {
                const CircularProgressIndicator();
                scanQRCode().then((value) {
                  if (value != null) {
                    if (scanOption == ScanOptions.package) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScanResultListPage(value)));
                    } else {
                      return showDialog(
                        context: context,
                        builder: (ctx) =>
                            AlertDialog(
                              title: const Text("Сертификат сохранен успешно"),
                              content: const Text(
                                  "Для сохранения рулонов из сертификата перейдите на вкладку 'Сертификаты в ожидании'"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text("ОК"),
                                ),
                              ],
                            ),
                      );
                    }
                  } else if (qrCode != '-1') {
                    return showDialog(
                      context: context,
                      builder: (ctx) =>
                          AlertDialog(
                            title: const Text("Ошибка сохранения"),
                            content: const Text(
                                "Проверьте корректность сканируемого QR кода"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text("ОК"),
                              ),
                            ],
                          ),
                    );
                  } else {
                    return showDialog(
                      context: context,
                      builder: (ctx) =>
                          AlertDialog(
                            title: const Text("Ошибка"),
                            content: const Text(
                                "Проверьте корректность сканируемого QR кода"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text("ОК"),
                              ),
                            ],
                          ),
                    );
                  }
                });
              },
              child: const Text(
                "Сканировать",
                style: TextStyle(color: Colors.white),
              ),
              color: AppTheme.colors.blue,
              shape: const StadiumBorder(),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Future<Certificate?> scanQRCode() async {
    late Future<Certificate?> result;
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return null;

      setState(() {
        this.qrCode = qrCode;
        if (scanOption == ScanOptions.package) {
          result = Service.createByPackage(qrCode);
        } else {
          result = Service.createByCertificate(qrCode);
        }
      });
      return result;
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
    return null;
  }
}
