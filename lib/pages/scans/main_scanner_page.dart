
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';
import 'package:supply_io/pages/scans/qr_scan_page.dart';
import 'package:supply_io/pages/sidebar/navigation_bloc.dart';

class MyApp extends StatelessWidget with NavigationStates {
  static final String title = 'QR Code Scanner';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.white,
    ),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String qrCode = 'Unknown';
  @override
  Widget build(BuildContext context) => Scaffold(
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
              child: Text('Добавление рулона',
                  style: TextStyle(fontSize: 24,
                  color: AppTheme.colors.darkGradient,
                  fontWeight: FontWeight.w500),
              ))),
      Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 120),
        child: Text('Для регистрации рулона нажмите кнопку "Сканировать" и наведите на QR код на этикетке рулона или сертификате. В случае получения результата в виде списка рулонов, выберите необходимый по идентификатору на этикетке и продолжите работу. ',
            style: TextStyle(fontSize: 14))),
          TextButton(
            onPressed: () => scanQRCode(),
            child: Text('  Сканировать  '),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: AppTheme.colors.darkGradient)
                      )
                  )
              )
          ),
          const SizedBox(height: 32),
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
