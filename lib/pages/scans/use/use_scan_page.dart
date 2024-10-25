import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supply_io/pages/lists/packages_in_stock.dart';

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
  String qrCode = '-1';
  late Certificate result;

  void setItem(String itemValue) {
    qrCode = itemValue;
    itemChanged();
  }

  void itemChanged() {
    usingAction().then((value) {
      if (value != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UseScanResultListPage(value)));
      } else if (qrCode != '-1') {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Ошибка сохранения"),
            content: const Text("Проверьте корректность сканируемого QR кода"),
            actions: <Widget>[
              TextButton(
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
          builder: (ctx) => AlertDialog(
            title: const Text("Ошибка"),
            content: const Text("Проверьте корректность сканируемого QR кода"),
            actions: <Widget>[
              TextButton(
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
  }

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
              Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 40),
                child: Row(children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      backgroundColor: AppTheme.colors.blue,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      const CircularProgressIndicator();
                      scanQRCode().then((value) {
                        if (value != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UseScanResultListPage(value)));
                        } else if (qrCode != '-1') {
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Ошибка сохранения"),
                              content: const Text("Проверьте корректность сканируемого QR кода"),
                              actions: <Widget>[
                                TextButton(
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
                            builder: (ctx) => AlertDialog(
                              title: const Text("Ошибка"),
                              content: const Text("Проверьте корректность сканируемого QR кода"),
                              actions: <Widget>[
                                TextButton(
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
                  ),
                  const Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      backgroundColor: AppTheme.colors.blue,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PackagesInStockListPage()));
                    },
                    child: const Text(
                      "Список",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );

  Future<Certificate?> usingAction() async {
    return Service.sendUseByLink(qrCode);
  }

  Future<Certificate?> scanQRCode() async {
    late Future<Certificate?> future;
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ffffff',
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
