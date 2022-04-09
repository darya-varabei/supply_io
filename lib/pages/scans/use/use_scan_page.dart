import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supply_io/pages/scans/qr_scan_page.dart';

import '../../../helpers/theme/app_theme.dart';
import '../../../model/supply/certificate_model.dart';
import '../../../model/supply/package_model.dart';
import '../../../model/supply/product_model.dart';
import '../../../model/supply/size_model.dart';
import '../../../model/supply/status_model.dart';
import '../../../model/supply/weight_model.dart';
import '../../lists/use_scan_result_list.dart';
import '../../sidebar_new/navigation_drawer.dart';

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
                      child: Text(
                        'Использование рулона',
                        style: TextStyle(
                            fontSize: 24,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w500),
                      ))),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 120),
                  child: const Text(
                      'Для регистрации обработки рулона отсканируйте QR код на упаковке. В случае получения результата в виде списка рулонов, выберите необходимый по идентификатору на этикетке и продолжите работу. После регистрации рулон переместится в список на вкладке "В обработке"',
                      style: TextStyle(fontSize: 14))),
              FlatButton(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
              UseScanResultListPage(Certificate(certificateId: 1,
              link: "",
              number: "56327",
              date: "14.01.2022",
              author: "",
              authorAddress: "",
              fax: "",
              recipient: "",
              recipientCountry: "",
              product: Product(productId: 1,
              name: "ggg",
              labeling: 1,
              code: 2),
              shipmentShop: "",
              wagonNumber: "",
              orderNumber: "4",
              typeOfRollingStock: "1",
              typeOfPackaging: "",
              placeNumber: "",
              gosts: "",
              notes: "",
              packages: [Package(packageId: 1,
              dateAdded: "",
              dateChange: "",
              status:Status(statusId: 1, statusName: ''),
              namberConsignmentPackage: "",
              heat: "",
              batch: "46755",
              size: XSize(sizeId: 1,
              thickness: 0.5,
              width: 1230,
              length: 1000.0),
              quantity: 1,
              variety: "",
              gost: "",
              grade: "08Ю",
              weight: Weight(weightId: 1,
              gross: 7289,
              gross2: 0,
              net: 7200
              ),
              surfaceQuality: "",
              )],
              ))));
              }, //=> scanQRCode(),
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
