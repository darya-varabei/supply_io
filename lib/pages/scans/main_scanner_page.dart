
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      scaffoldBackgroundColor: Colors.black,
    ),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => QRScanPage(),
            )),
            child: Text('Сканировать'),
          ),
          const SizedBox(height: 32),

        ],
      ),
    ),
  );
}
