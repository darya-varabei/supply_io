
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supply_io/pages/sidebar_new/navigation_drawer.dart';

import '../helpers/theme/app_theme.dart';
import '../model/defect_model.dart';
import '../model/supply/package_model.dart';

class ReportdDefectPage extends StatefulWidget {
  Package package;

  ReportdDefectPage(this.package);
  @override
  _ReportdDefectPageState createState() => _ReportdDefectPageState(package: package);
}

class _ReportdDefectPageState extends State<ReportdDefectPage> {
  late File _image;
  Package package;
  String description = "";
Defect defect = new Defect(rollId: "", description: "");
  _ReportdDefectPageState(
      {required this.package});
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
                      onPressed: () {Navigator.pop(context);},
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
                        onPressed: () { getImage(); },
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
                    ]))),
            Flexible(
              flex: 1,
              child: _image == null ? new Text("No image selected") : new Image.file(_image),
            ),
            Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 54),
                      onPressed: () {
                        defect.description = description;
                        defect.rollId = package.batch;
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Сохранить",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: AppTheme.colors.blue,
                      shape: StadiumBorder(),
                    ),
                  ]),
                )),
          ]),
        ),
      );

  Future getImage() async {
    ImagePicker picker = new ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image as File;
    });
  }
}
