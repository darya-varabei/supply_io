import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/pages/sidebar_new/navigation_drawer.dart';

import '../helpers/theme/app_theme.dart';

class ReportdDefectPage extends StatefulWidget {
  @override
  _ReportdDefectPageState createState() => _ReportdDefectPageState();
}

class _ReportdDefectPageState extends State<ReportdDefectPage> {
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
                        "Сертификат № 257165765",
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
                      "56578",
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
                  width: MediaQuery.of(context).size.width - 80,
                  height: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Row(children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {},
                    ),
                    Spacer(),
                    SizedBox(
                      width: 190,
                      child: Text(
                        "Описание дефекта",
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
                  alignment: Alignment.centerLeft,
                  child: Column(children: <Widget>[
                    TextFormField(
                      minLines: 6,
                      // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    )
                  ]),
                )),
            Flexible(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.fromLTRB(40, 8, 40, 10),
                    alignment: Alignment.centerLeft,
                    child: Column(children: <Widget>[
                      RaisedButton.icon(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        label: Text(
                          'Прикрепить фото',
                          style: TextStyle(color: AppTheme.colors.blue),
                        ),
                        icon: Icon(
                          Icons.camera_front_outlined,
                          color: AppTheme.colors.blue,
                        ),
                        textColor: AppTheme.colors.blue,
                        splashColor: AppTheme.colors.blue,
                        color: AppTheme.colors.white,
                      ),
                    ])))
          ]),
        ),
      );
}
