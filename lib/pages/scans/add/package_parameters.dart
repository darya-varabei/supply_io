import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/pages/scans/add/update_parameters_page.dart';

import '../../../helpers/theme/app_theme.dart';
import '../../../model/supply/package_model.dart';
import '../../../model/user/login_model.dart';
import '../../sidebar_new/navigation_drawer.dart';
import 'package:http/http.dart' as http;

class PackageParametersPage extends StatefulWidget {
  Package result;
  String certificateId;
  int certificateNumber;

  PackageParametersPage(this.result, this.certificateId, this.certificateNumber, {Key? key}) : super(key: key);

  @override
  _PackageParametersPageState createState() =>
      _PackageParametersPageState(result: result, certificateId: certificateId, certificateNumber: certificateNumber);
}

class _PackageParametersPageState extends State<PackageParametersPage> {
  Package result;
  String certificateId;
  int certificateNumber;

  _PackageParametersPageState(
      {required this.result, required this.certificateId, required this.certificateNumber});

  void updateInformation(Package updatedResult) {
    setState(() => result = updatedResult);
  }

  void moveToSecondPage() async {
    final information = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context) => UpdateParametersPage(result, certificateId)),
    );
    updateInformation(information);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width - 80,
              height: double.infinity,
              alignment: Alignment.centerRight,
              child: Row(children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: 190,
                  child: Text(
                    "Сертификат № $certificateId",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.colors.darkGradient,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ]),
            )),
        Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(40, 8, 40, 10),
              alignment: Alignment.centerRight,
              child: Column(children: <Widget>[
                Text(
                  result.batch!,
                  style: TextStyle(
                      fontSize: 24,
                      color: AppTheme.colors.darkGradient,
                      fontWeight: FontWeight.w400),
                ),
              ]),
            )),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Марка стали",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                "${result.grade}",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Производитель",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                result.batch!,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Толщина",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                "${result.size?.thickness}",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Ширина",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                "${result.size?.width}",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Масса(брутто)",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                "${result.weight.gross}",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Масса(нетто)",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                "${result.weight.net}",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ),
        Flexible(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(children: <Widget>[
                FlatButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 26),
                  onPressed: () {
                    moveToSecondPage();
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateParametersPage(result, certificateId)));
                  },
                  child: Text(
                    "Внести изменения",
                    style: TextStyle(color: AppTheme.colors.blue),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: AppTheme.colors.blue,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ]),
            )),
        Flexible(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(children: <Widget>[
                FlatButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 54),
                  onPressed: () async {
                    var requestResult = await savePackage();
                    if (requestResult < 400) {
                      Navigator.of(context).pop();
                    } else if (requestResult == 404) {
                      showMyDialog("Ошибка",
                          "Не удается установить интернет соединение");
                      Navigator.of(context).pop();
                    } else {
                      showMyDialog("Ошибка", "Не удается выполнить сохранение");
                      Navigator.of(context).pop();
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Сохранить",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: AppTheme.colors.blue,
                  shape: const StadiumBorder(),
                ),
              ]),
            )),
      ])));

  Future<int> savePackage() async {
     String token = "";
    final Uri apiUrl = Uri.parse('https://192.168.100.11:44335/api/parcer/package/${certificateNumber}');
    String body = json.encode(result.toJson());
    final response = await http.post(apiUrl,
        headers: {
          "Content-Type": "application/json",
        },
    body: json.encode(result.toJson()));
    return response.statusCode;
  }

  /// Print Long String
  void printLongString(String text) {
    final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((RegExpMatch match) =>   print(match.group(0)));
  }

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  Future<void> showMyDialog(String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Готово'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
