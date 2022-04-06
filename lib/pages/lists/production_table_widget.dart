import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/model/supply/package_model.dart';

import '../../helpers/theme/app_theme.dart';
import '../report_defect_page.dart';
import '../sidebar_new/navigation_drawer.dart';

class ProductionTableWidget extends StatefulWidget {
  ProductionTableWidget();
  @override
  State createState() => new ProductionTableWidgetState();
}

class ProductionTableWidgetState extends State<ProductionTableWidget> {
  bool isSelected = false;
  late Package selectedPackage;
  List<Package>? packagesInUse;
  Color buttonColor = AppTheme.colors.grey;
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Column(children: <Widget>[
                      Text(
                        "В обработке",
                        style: TextStyle(
                            fontSize: 28,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  )),
              Flexible(
                  flex: 6,
                  child: ListView.builder(
                      itemCount: packagesInUse?.length,
                      itemBuilder: (context, position) {

                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),

                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ListTile(
                                onTap: () {
                                  if (isSelected == true) {
                                  isSelected = false;
                                  actOnCellTap(AppTheme.colors.red);
                                  }
                                  else {
                                    isSelected = true;
                                    actOnCellTap(AppTheme.colors.grey);
                                  }
                                },
                                title: Text(packagesInUse![position].batch),
                                trailing: Icon(
                                  Icons.arrow_forward,
                                  color: AppTheme.colors.darkGradient,
                                  size: 20.0,
                                ),
                              )),
                        );
                      })),
              Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(children: <Widget>[
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 26),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ReportdDefectPage(selectedPackage)));
                        },
                        child: Text(
                          "Сообщить о дефекте",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: isSelected ? AppTheme.colors.blue : AppTheme.colors.grey,
                        shape: StadiumBorder(),
                      ),
                    ]),
                  )),
            ]),
      ));

  void actOnCellTap(Color newColor) {
    setState(() {
      buttonColor = newColor;
    });
  }
}

