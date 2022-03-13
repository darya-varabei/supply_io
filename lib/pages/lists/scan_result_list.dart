import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/theme/app_theme.dart';
import '../sidebar_new/navigation_drawer.dart';

class ScanResultListPage extends StatefulWidget {

  @override
  _ScanResultListPageState createState() => _ScanResultListPageState();
}

class _ScanResultListPageState extends State<ScanResultListPage> {
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
  alignment: Alignment.centerRight,
  child: Container(
  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
  child: Text('Сертификат №',
  style: TextStyle(fontSize: 24,
  color: AppTheme.colors.darkGradient,
  fontWeight: FontWeight.w500),
  ))),
    ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: ListTile(
            onTap: () {},
            title: Text("Кусь"),
            trailing: Icon(
              Icons.arrow_forward,
              color: AppTheme.colors.darkGradient,
              size: 20.0,
            ),
          )
        );
      }
    ),

    FlatButton(
      padding: EdgeInsets.symmetric(
          vertical: 20, horizontal: 80),
      onPressed: () => null,//scanQRCode(),
      child: Text(
        "Сохранить",
        style: TextStyle(color: Colors.white),
      ),
      color: AppTheme.colors.blue,
      shape: StadiumBorder(),
    ),
    SizedBox(height: 15),
    ]
  ),
  ),
  );
}