import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/pages/lists/production_table_widget.dart';

import '../../helpers/theme/app_theme.dart';
import '../../model/supply/certificate_model.dart';
import '../../model/supply/package_model.dart';
import '../sidebar_new/navigation_drawer.dart';

class UseScanResultListPage extends StatefulWidget {
  Certificate result;
  UseScanResultListPage(this.result);
  @override
  _UseScanResultListPageState createState() => _UseScanResultListPageState(result: result);
}

class _UseScanResultListPageState extends State<UseScanResultListPage> {
  bool isSelected = false;
  late Package selectedPackage;
  Color buttonColor = AppTheme.colors.grey;
  int _selectedIndex = -1;
  Certificate result;
  _UseScanResultListPageState({required this.result});
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 20, 40, 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: double.infinity,
                    alignment: Alignment.centerRight,
                    child: Row(children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                      Spacer(),
                      SizedBox(
                        width: 190,
                        child: Text(
                          "Сертификат № ${result.certificateId}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 28,
                              color: AppTheme.colors.darkGradient,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
                  )),
              SizedBox(height: 20),
              Flexible(
                  flex: 6,
                  child: ListView.builder(
                      itemCount: result.packages.length,
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
                                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                ProductionTableWidget()));
                                    //PackageParametersPage(result.packages[position], result.certificateId)));
                                },
                                title: Text("${result.packages[position].packageId}"),
                                trailing: Icon(
                                  Icons.arrow_forward,
                                  color: AppTheme.colors.darkGradient,
                                  size: 20.0,
                                ),
                              )),
                        );
                      })),
            ]),
      ));
}
