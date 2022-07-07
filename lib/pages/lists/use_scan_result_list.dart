import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/pages/lists/production_table_widget.dart';

import '../../helpers/theme/app_theme.dart';
import '../../model/supply/certificate_model.dart';
import '../../model/supply/package_model.dart';
import '../../model/user/login_model.dart';
import '../../service/service.dart';
import '../sidebar_new/navigation_drawer.dart';
import 'package:http/http.dart' as http;

class UseScanResultListPage extends StatefulWidget {
  Certificate result;

  UseScanResultListPage(this.result, {Key? key}) : super(key: key);

  @override
  _UseScanResultListPageState createState() =>
      _UseScanResultListPageState(result: result);
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
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
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
                      const Spacer(),
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
              const SizedBox(height: 20),
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
                                onTap: () async {
                                  var res = await Service.usePackage(
                                      result.packages[position]).then((value) {
                                    // if (value != null) {
                                    //   setState(() {
                                    //     isApiCallProcess = false;
                                    //   });
                                    // }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const ProductionTableWidget()));
                                  });
                                },
                                title: Text(
                                    "${result.packages[position].batch}"),
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

  Future<int> usePackage(Package packageToUse) async {
    String token = await getJwtOrEmpty();
    final Uri apiUrl = Uri.parse("${SERVER_IP}/api/parcer/package?batch=${packageToUse.batch}&status=2");
    final response = await http.put(apiUrl);
    return response.statusCode;
  }

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }
}
