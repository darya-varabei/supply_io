import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/theme/app_theme.dart';
import '../../../model/supply/certificate_model.dart';
import '../../../model/supply/package_model.dart';
import '../../sidebar_new/navigation_drawer.dart';

class PackageParametersPage extends StatefulWidget {

  Package result;
  int certificateId;
  PackageParametersPage(this.result, this.certificateId);
  @override
  _PackageParametersPageState createState() => _PackageParametersPageState(result: result, certificateId: certificateId);
}

class _PackageParametersPageState extends State<PackageParametersPage> {
  Package result;
  int certificateId;
  _PackageParametersPageState({required this.result, required this.certificateId});
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
                  onPressed: () {},
                ),
                Spacer(),
                SizedBox(
                  width: 190,
                  child: Text(
                    "Сертификат № ${certificateId}",
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
              padding: EdgeInsets.fromLTRB(40, 8, 40, 10),
              alignment: Alignment.centerRight,
              child: Column(children: <Widget>[
                Text(
                  "${result.batch}",
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
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Марка стали",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
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
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Производитель",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                "Северсталь",
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
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Толщина",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                "${result.size.thickness}",
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
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Ширина",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                "${result.size.width}",
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
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Масса(брутто)",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
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
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(children: <Widget>[
              Text(
                "Масса(нетто)",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.colors.darkGradient,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
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
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 26),
                  onPressed: () {

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
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 54),
                  onPressed: () {},
                  child: Text(
                    "Сохранить",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: AppTheme.colors.blue,
                  shape: StadiumBorder(),
                ),
              ]),
            )),
      ])));
}
