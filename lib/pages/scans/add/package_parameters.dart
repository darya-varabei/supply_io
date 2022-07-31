import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/model/supply/package_in_use_model.dart';
import 'package:supply_io/model/supply/status_model.dart';
import 'package:supply_io/pages/report_defect_page.dart';

import '../../../helpers/theme/app_theme.dart';
import '../../../model/supply/package_model.dart';
import '../../../model/user/login_model.dart';
import '../../../service/service.dart';
import '../../sidebar_new/navigation_drawer.dart';

enum ParameterState {
    add,
    use
}

class PackageParametersPage extends StatefulWidget {
  Package result;
  String certificateId;
  int certificateNumber;
  String author;
  ParameterState parameterState;

  PackageParametersPage(this.result, this.certificateId, this.certificateNumber, this.author, this.parameterState, {Key? key}) : super(key: key);

  @override
  _PackageParametersPageState createState() =>
      _PackageParametersPageState(result: result, certificateId: certificateId, certificateNumber: certificateNumber, author: author, parameterState: parameterState);
}

class _PackageParametersPageState extends State<PackageParametersPage> {
  Package result;
  String certificateId;
  int certificateNumber;
  String author;
  ParameterState parameterState;
  _PackageParametersPageState(
      {required this.result, required this.certificateId, required this.certificateNumber, required this.author, required this.parameterState});

  void updateInformation(Package updatedResult) {
    setState(() => result = updatedResult);
  }

  void moveToSecondPage() async {
    PackageInUseModel packageInUse = PackageInUseModel(supplyDate: result.dateAdded, grade: result.grade, numberOfCertificate: certificateId,
        batch: result.batch, width: result.size?.width, thickness: result.size?.thickness, height: "${result.size?.length}",
        mill: "", coatingClass: result.surfaceQuality, sort: "", supplier: "", elongation: "", price: "", comment: "", status: result.status?.statusName);
    Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context) => ReportdDefectPage(packageInUse)),
    );
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
                author,
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
                "${result.weight?.gross}",
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
                "${result.weight?.net}",
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
                  },
                  child: Text(
                    "Сообщить о дефекте",
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
                    if (parameterState == ParameterState.add) {
                      result.status =
                          Status(statusId: 2, statusName: "Имеется");
                      var requestResult = await Service.savePackage(
                          result, certificateNumber);
                      if (requestResult < 400) {
                        showMyDialog("Сохранено",
                            "Сохранение выполнено успешно");
                        Navigator.of(context).pop();
                      } else if (requestResult == 404) {
                        showMyDialog("Ошибка",
                            "Не удается установить интернет соединение");
                        Navigator.of(context).pop();
                      } else {
                        showMyDialog("Ошибка",
                            "Не удается выполнить сохранение");
                        Navigator.of(context).pop();
                      }
                      Navigator.of(context).pop();
                    } else {
                      var requestResult = await Service.sendUseById(
                          result.batch ?? "");
                      if (requestResult != null) {
                        showMyDialog("Сохранено",
                            "Рулон переведен в обработку");
                        Navigator.of(context).pop();
                      } else if (requestResult == 404) {
                        showMyDialog("Ошибка",
                            "Не удается установить интернет соединение");
                        Navigator.of(context).pop();
                      } else {
                        showMyDialog("Ошибка",
                            "Не удается выполнить отправку в обработку");
                        Navigator.of(context).pop();
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    parameterState == ParameterState.add ? "Сохранить" : "В обработку",
                    style: const TextStyle(color: Colors.white),
                  ),
                  color: AppTheme.colors.blue,
                  shape: const StadiumBorder(),
                ),
              ]),
            )),
      ])));

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  Future<void> showMyDialog(String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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
