import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';
import 'package:supply_io/model/supply/certificate_model.dart';
import 'package:supply_io/pages/scans/qr_scan_page.dart';
import '../../../helpers/animated_items/progressHUD.dart';
import '../../lists/scan_result_list.dart';
import '../../sidebar_new/navigation_drawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String qrCode = 'Unknown';
  bool isApiCallProcess = false;
  late Certificate result;

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
    return Scaffold(
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
                      'Добавление рулона',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppTheme.colors.darkGradient,
                          fontWeight: FontWeight.w500),
                    ))),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                child: const Text(
                    'Для регистрации рулона нажмите кнопку "Сканировать" и наведите на QR код на этикетке рулона или сертификате. В случае получения результата в виде списка рулонов, выберите необходимый по идентификатору на этикетке и продолжите работу. ',
                    style: TextStyle(fontSize: 14))),
            FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              onPressed: () {
                const CircularProgressIndicator();
                scanQRCode().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScanResultListPage(value!)));
                });

                //  );
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

        result = createUser(qrCode);
      });
      return result;
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
