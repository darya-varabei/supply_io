import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supply_io/pages/sidebar_new/navigation_drawer.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../helpers/theme/app_theme.dart';
import '../model/defect_model.dart';
import '../model/supply/package_model.dart';
import '../model/user/login_model.dart';
import 'package:http/http.dart' as http;

class ReportdDefectPage extends StatefulWidget {
  Package package;

  ReportdDefectPage(this.package);

  @override
  _ReportdDefectPageState createState() =>
      _ReportdDefectPageState(package: package);
}

class _ReportdDefectPageState extends State<ReportdDefectPage> {
  File? _image = null;
  Package package;
  String description = "";
  late Defect defect;

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
                                  fontSize: 20,
                                  color: AppTheme.colors.darkGradient,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ]),
                        const SizedBox(height: 40.0),
            Row(children: <Widget>[
              Text(
                          "Описание дефекта",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.colors.darkGradient,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Text("")
              ]
            ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          textInputAction: TextInputAction.go,
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        const SizedBox(height: 20.0),
                        Column(children: <Widget>[
                          Row(children: <Widget>[
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
                          Spacer(),
                         _image == null
                             ? new Text("")
                             : Container(
                           width: 100,
                           height: 100,
                           child: Image.file(_image!),
                         ),
                        ]
                          ),
                        ]
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(children: <Widget>[
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 54),
                              onPressed: () {
                                defect.description = description;
                                defect.rollId = package.batch;
defect.defectPhoto = Image.file(_image!) as FileImage;
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
                        ),
                        const SizedBox(height: 50.0),
                      ]))),
        ),
      );

  Future getImage() async {
    XFile? pickerFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
    setState(() {
      GallerySaver.saveImage(pickerFile!.path, albumName: "albumName");
      _image = File(pickerFile!.path);
    });
   // Navigator.pop(context);
  }

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if(jwt == null) return "";
    return jwt;
  }

  Future<int> saveDefect() async {
    String token = await getJwtOrEmpty();
    final Uri apiUrl = Uri.parse(SERVER_IP);
    final response = await http.post( apiUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'access_token': token,
    },body:
    defect.toJson()
    );
    return response.statusCode;
  }
}
