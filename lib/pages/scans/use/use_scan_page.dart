import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supply_io/pages/lists/packages_in_stock.dart';
import 'package:supply_io/pages/scans/qr_scan_page.dart';

import '../../../helpers/theme/app_theme.dart';
import '../../../model/supply/certificate_model.dart';
import '../../../service/service.dart';
import '../../lists/use_scan_result_list.dart';
import '../../sidebar_new/navigation_drawer.dart';

class UseRollPage extends StatefulWidget {
  const UseRollPage({Key? key}) : super(key: key);

  @override
  _UseRollPageState createState() => _UseRollPageState();
}

class _UseRollPageState extends State<UseRollPage> {
  String qrCode = 'Unknown';
  late Certificate result;

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
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Text(
                        'Использование рулона',
                        style: TextStyle(
                            fontSize: 24,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w500),
                      ))),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                  child: const Text(
                      'Для регистрации обработки рулона отсканируйте QR код на упаковке. В случае получения результата в виде списка рулонов, выберите необходимый по идентификатору на этикетке и продолжите работу. После регистрации рулон переместится в список на вкладке "В обработке"',
                      style: TextStyle(fontSize: 14))),
          Row(children: <Widget>[
              FlatButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                onPressed: () {
                  const CircularProgressIndicator();
                  scanQRCode().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UseScanResultListPage(value!)));
                  });
                },
                child: const Text(
                  "Сканировать",
                  style: TextStyle(color: Colors.white),
                ),
                color: AppTheme.colors.blue,
                shape: const StadiumBorder(),
              ),
            const Spacer(),
            FlatButton(
              padding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                             PackagesInStockListPage()));
              },
              child: const Text(
                "Список",
                style: TextStyle(color: Colors.white),
              ),
              color: AppTheme.colors.blue,
              shape: const StadiumBorder(),
            ),
  ]),

              const SizedBox(height: 15),
            ],
          ),
        ),
      );

  Future<Certificate?> scanQRCode() async {
    late Future<Certificate?> future;
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
        future = Service.sendUseByLink(qrCode);
      });

      return future;
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
    return null;
  }
}
