import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:supply_io/pages/scans/add/main_scanner_page.dart';
import 'package:supply_io/service/service.dart';
import '../../../helpers/theme/app_theme.dart';
import '../../../model/supply/certificate_model.dart';
import '../../lists/scan_result_list.dart';
import '../../lists/use_scan_result_list.dart';

class QRScanPage extends StatefulWidget {
  ScanOptions scanOptions;

  QRScanPage({required this.scanOptions, Key? key}) : super(key: key);

  @override
  State<QRScanPage> createState() => _QRScanPageState(scanOptions: scanOptions);
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  String resultUrl = "";
  QRViewController? controller;
  ScanOptions scanOptions;
  bool isActionInProgress = false;

  _QRScanPageState({required this.scanOptions});

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null && mounted) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Text(
                        result != null
                            ? resultUrl.substring(0, min(resultUrl.length, 50))
                            : 'Начните сканировать',
                        style: const TextStyle(fontSize: 18),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 80),
                            backgroundColor: AppTheme.colors.blue,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: const Text('Назад',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 80),
                              backgroundColor: AppTheme.colors.blue,
                              shape: StadiumBorder(),
                            ),
                            onPressed: () async {
                              if (result != null && !isActionInProgress) {
                                isActionInProgress = true;
                                controller?.pauseCamera();
                                scanQRCode(
                                        result?.code ?? "", ScanOptions.package)
                                    .then((value) {
                                  if (value != null) {
                                    if (scanOptions == ScanOptions.package) {
                                      controller?.resumeCamera();
                                      isActionInProgress = false;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScanResultListPage(value)));
                                    } else if (scanOptions == ScanOptions.use) {
                                      isActionInProgress = false;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UseScanResultListPage(
                                                      value)));
                                    } else {
                                      controller?.resumeCamera();
                                      return showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text(
                                              "Сертификат сохранен успешно"),
                                          content: const Text(
                                              "Для сохранения рулонов из сертификата перейдите на вкладку 'Сертификаты в ожидании'"),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                isActionInProgress = false;
                                                Navigator.of(ctx).pop();
                                              },
                                              child: const Text("ОК"),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  } else {
                                    controller?.resumeCamera();
                                    return showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Ошибка"),
                                        content: const Text(
                                            "Проверьте корректность сканируемого QR кода"),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              isActionInProgress = false;
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
                            },
                            child: const Text('Использовать',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 250.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => {},
    );
  }

  Future<Certificate?> scanQRCode(String qrCode, ScanOptions scanOption) async {
    late Future<Certificate?> result;
    setState(() {
      if (scanOption == ScanOptions.package) {
        result = Service.createByPackage(qrCode, true);
      } else if (scanOption == ScanOptions.use) {
        result = Service.sendUseByLink(qrCode);
      } else {
        result = Service.createByCertificate(qrCode);
      }
    });
    return result;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        var startIndex = scanData.code?.indexOf("http");
        final resUrl = scanData.code?.substring(startIndex ?? 0);
        result = scanData;
        resultUrl = resUrl!;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
