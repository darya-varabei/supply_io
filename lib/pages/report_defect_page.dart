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
  _ReportdDefectPageState createState() =>
      _ReportdDefectPageState(package: package);
}

class _ReportdDefectPageState extends State<ReportdDefectPage> {
  late File? _image = null;
  Package package;
  String description = "";
  Defect defect = new Defect(rollId: "", description: "");

  _ReportdDefectPageState({required this.package});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: AppTheme.colors.darkGradient,
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Spacer(),
                          SizedBox(
                            width: 190,
                            child: Text(
                              "Упаковка №${package.batch}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.colors.darkGradient,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ]),
                        const SizedBox(height: 20.0),
                        Text(
                          "Описание дефекта",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.colors.darkGradient,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        Column(children: <Widget>[
                          RaisedButton.icon(
                            onPressed: () {
                              getImage();
                            },
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
                          _image == null
                              ? new Text("No image selected")
                              : new Image.file(_image!),
                        ]),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(children: <Widget>[
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 54),
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
                        )
                      ]))),
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
