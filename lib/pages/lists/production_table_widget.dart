import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/model/supply/package_model.dart';
import 'package:http/http.dart' as http;
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
  Color buttonColor = AppTheme.colors.grey;
  int _selectedIndex = -1;

  late Future<List<Package>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getPackagesInUse();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
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
                  child: FutureBuilder<List<Package>?>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Package>? data = snapshot.data;
                          return ListView.builder(
                              itemCount: data?.length,
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
                                          } else {
                                            isSelected = true;
                                            actOnCellTap(AppTheme.colors.grey);
                                          }
                                        },
                                        title: Text(data![position].batch),
                                        trailing: Icon(
                                          Icons.arrow_forward,
                                          color: AppTheme.colors.darkGradient,
                                          size: 20.0,
                                        ),
                                      )),
                                );
                              });
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        return Flexible(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Column(children: <Widget>[
                                const CircularProgressIndicator(),
                                FlatButton(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 26),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReportdDefectPage(
                                                    selectedPackage)));
                                  },
                                  child: const Text(
                                    "Сообщить о дефекте",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: isSelected
                                      ? AppTheme.colors.blue
                                      : AppTheme.colors.grey,
                                  shape: const StadiumBorder(),
                                ),
                              ]),
                            ));
                      }))
            ]),
      ));

  void actOnCellTap(Color newColor) {
    setState(() {
      buttonColor = newColor;
    });
  }

  Future<List<Package>> getPackagesInUse() async {
    final Uri apiUrl = Uri.parse("https://192.168.1.2:44335/api/");

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      var packageList = jsonDecode(responseString)['packages'] as List;
      List<Package> listDecoded =
          packageList.map((tagJson) => Package.fromJson(tagJson)).toList();
      return listDecoded;
    } else {
      return List.empty();
    }
  }
}
