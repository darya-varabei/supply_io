
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/pages/scans/qr_scan_page.dart';
import 'package:supply_io/pages/sidebar/navigation_bloc.dart';

import 'button_widget.dart';

class MainPage extends StatefulWidget with NavigationStates {
 // final String title;

  // const MainPage({
  //  // this.title,
  // });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      //title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          QRScanPage(),
          // ButtonWidget(
          //   text: 'Отсканировать QR код',
          //   onClicked: () => Navigator.of(context).push(MaterialPageRoute(
          //     builder: (BuildContext context) => QRScanPage(),
          //   )),
          // ),
        ],
      ),
    ),
  );
}