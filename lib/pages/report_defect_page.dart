import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supply_io/pages/sidebar_new/navigation_drawer.dart';
import '../helpers/theme/app_theme.dart';
import '../model/defect_model.dart';
import '../model/supply/package_in_use_model.dart';
import '../model/user/login_model.dart';

import '../service/service.dart';

class ReportdDefectPage extends StatefulWidget {
  PackageInUseModel package;

  ReportdDefectPage(this.package, {Key? key}) : super(key: key);

  @override
  _ReportdDefectPageState createState() =>
      _ReportdDefectPageState(package: package);
}

class _ReportdDefectPageState extends State<ReportdDefectPage> {
  List<File> images = [];
  PackageInUseModel package = PackageInUseModel(
      supplyDate: "",
      grade: "08ПС",
      numberOfCertificate: "44567",
      width: "1240",
      thickness: "1.2",
      height: "23.4",
      mill: null,
      coatingClass: null,
      sort: null,
      supplier: "НЛМК",
      elongation: null,
      price: null,
      comment: null,
      status: "Имеется");
  String description = "";
  Defect defect = Defect(rollId: "", description: "", defectPhoto: []);
  TextEditingController messageController = TextEditingController();

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
                  child: Column(children: [
                    Row(children: <Widget>[
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
                          "Упаковка № ${package.numberOfCertificate}",
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
                      const Spacer(),
                      const Text("")
                    ]),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      textInputAction: TextInputAction.go,
                      minLines: 6,
                      controller: messageController,
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
                          shape: const RoundedRectangleBorder(
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
                        const Spacer(),
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext ctx, int index) {
                            return SizedBox(
                                         width: 100,
                                         height: 100,
                                         child: Image.file(images[index]));
                          },
                          itemCount: images.length,
                        ),
                      ]),
                    ]),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(children: <Widget>[
                        FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 54),
                          onPressed: () {
                            defect.description = messageController.text;
                            defect.rollId = package.batch!;
                            Service.saveDefect(defect, images);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Сохранить",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: AppTheme.colors.blue,
                          shape: const StadiumBorder(),
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
      images.add(File(pickerFile!.path));
    });
  }

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  // Future<int> saveDefect() async {
  //   String token = await getJwtOrEmpty();
  //   final Uri apiUrl =
  //       Uri.parse('${SERVER_IP}/api/parcer/package/defect');
  //   if (_image != null) {
  //     List<int> imageBytes = _image!.readAsBytesSync();
  //     String base64Image = base64Encode(imageBytes);
  //     defect.defectPhoto = Uint8List.fromList(imageBytes);
  //   }

  //   final response = await http.put(apiUrl,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: json.encode(defect.toJson()));
  //   return response.statusCode;
  // }
}
