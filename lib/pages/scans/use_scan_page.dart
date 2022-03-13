import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supply_io/pages/scans/qr_scan_page.dart';

import '../../helpers/theme/app_theme.dart';
import '../sidebar_new/navigation_drawer.dart';

class UseRollPage extends StatefulWidget {

  @override
  _UseRollPageState createState() => _UseRollPageState();
}

class _UseRollPageState extends State<UseRollPage> {
  String qrCode = 'Unknown';
  @override
  Widget build(BuildContext context) => Scaffold(
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
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text('Использование рулона',
                    style: TextStyle(fontSize: 24,
                        color: AppTheme.colors.darkGradient,
                        fontWeight: FontWeight.w500),
                  ))),
          Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 120),
              child: Text('Для регистрации обработки рулона отсканируйте QR код на упаковке. В случае получения результата в виде списка рулонов, выберите необходимый по идентификатору на этикетке и продолжите работу. После регистрации рулон переместится в список на вкладке "В обработке"',
                  style: TextStyle(fontSize: 14))),

          FlatButton(
            padding: EdgeInsets.symmetric(
                vertical: 20, horizontal: 80),
            onPressed: () => scanQRCode(),
            child: Text(
              "Сканировать",
              style: TextStyle(color: Colors.white),
            ),
            color: AppTheme.colors.blue,
            shape: StadiumBorder(),
          ),
          SizedBox(height: 15),
        ],
      ),
    ),
  );

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {

        this.qrCode = qrCode;
        createUser(qrCode);
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}