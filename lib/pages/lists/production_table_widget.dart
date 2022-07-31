import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../helpers/theme/app_theme.dart';
import '../../model/supply/package_in_use_model.dart';
import '../../model/user/login_model.dart';
import '../report_defect_page.dart';
import '../sidebar_new/navigation_drawer.dart';

class ProductionTableWidget extends StatefulWidget {
  const ProductionTableWidget();

  @override
  State createState() => ProductionTableWidgetState();
}

class ProductionTableWidgetState extends State<ProductionTableWidget> {
  bool isSelected = false;
  late PackageInUseModel selectedPackage;
  Color buttonColor = AppTheme.colors.grey;
  int selectedIndex = 0;

  late Future<List<PackageInUseModel>> futureData;

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
                  flex: 2,
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
                        shape: const StadiumBorder(),)
                    ]),
                  )),
              Flexible(
                  flex: 6,
                  child: FutureBuilder<List<PackageInUseModel>?>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<PackageInUseModel>? data = snapshot.data;
                          return ListView.builder(
                              itemCount: data?.length,
                              itemBuilder: (context, position) {
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: position == selectedIndex ? AppTheme.colors.grey : AppTheme.colors.white,
                                  child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: ListTile(
                                        onTap: () {
                                          if (isSelected == true) {
                                            selectedIndex = position;
                                            isSelected = false;
                                            selectedPackage = data![position];
                                            actOnCellTap(AppTheme.colors.red);
                                          } else {
                                            selectedIndex = position;
                                            selectedPackage = data![position];
                                            isSelected = true;
                                            actOnCellTap(AppTheme.colors.grey);
                                          }
                                        },
                                        title: Text(data![position].batch!),
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
                                // FlatButton(
                                //   padding: const EdgeInsets.symmetric(
                                //       vertical: 13, horizontal: 26),
                                //   onPressed: () {
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 ReportdDefectPage(
                                //                     selectedPackage)));
                                //   },
                                //   child: const Text(
                                //     "Сообщить о дефекте",
                                //     style: TextStyle(color: Colors.white),
                                //   ),
                                //   color: isSelected
                                //       ? AppTheme.colors.blue
                                //       : AppTheme.colors.grey,
                                //   shape: const StadiumBorder(),
                                //),
                              ]
                              ),
                            ));
                      }))
            ]
        ),
      ));

  void actOnCellTap(Color newColor) {
    setState(() {
      buttonColor = newColor;
    });
  }

  Future<List<PackageInUseModel>> getPackagesInUse() async {
    final Uri apiUrl = Uri.parse("${SERVER_IP}/api/parcer/package?status=В%20обработке");
    String token = await getJwtOrEmpty();
    final response = await http.get(apiUrl, headers: {
      'access_token': token,
    });

    if (response.statusCode < 400) {
      final String responseString = response.body;
      var packageList = jsonDecode(responseString);//['packages'] as List;
      List<PackageInUseModel>? listDecoded = [PackageInUseModel(supplyDate: "", grade: "08ПС", numberOfCertificate: "44567", width: 1240, thickness: 1.2, height: "23.4", mill: null, coatingClass: null, sort: null, supplier: "НЛМК",elongation: null, price: null,  comment: null, status: "Имеется" ),PackageInUseModel(supplyDate: "", grade: "08ПС", numberOfCertificate: "44568", width: 1240, thickness: 1.2, height: "23.4", mill: null, coatingClass: null, sort: null, supplier: "НЛМК",elongation: null, price: null,  comment: null, status: "Имеется" )];
      listDecoded = (json.decode(response.body) as List).map((i) =>
          PackageInUseModel.fromJson(i)).toList();
      return listDecoded;
    } else {
      return List.empty();
    }
  }

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }
}
