import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supply_io/pages/sidebar_new/navigation_drawer.dart';
import '../helpers/theme/app_theme.dart';
import '../model/defect_model.dart';
import '../model/supply/package_in_use_model.dart';

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
  PackageInUseModel package;
  String description = "";
  Defect defect = Defect(rollId: 0, description: "", defectPhoto: []);
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
                        width: 250,
                        child: Text(
                          "Упаковка № ${package.batch}",
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
                        ElevatedButton.icon(
                          onPressed: () {
                            getImage();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                            foregroundColor: AppTheme.colors.blue,
                           backgroundColor: AppTheme.colors.white,
                          ),
                          label: Text(
                            'Прикрепить фото',
                            style: TextStyle(color: AppTheme.colors.blue),
                          ),
                          icon: Icon(
                            Icons.camera_front_outlined,
                            color: AppTheme.colors.blue,
                          ),
                        ),
                        const Spacer(),
                      ]),
                      Column(children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext ctx, int index) {
                              return SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.file(images[index]));
                            },
                            itemCount: images.length,
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 54),
                            backgroundColor:
                            messageController.text.isEmpty || images.isEmpty
                                ? AppTheme.colors.grey
                                : AppTheme.colors.blue,
                            shape: StadiumBorder(),
                      ),
                          onPressed: () {
                            if (messageController.text.isEmpty ||
                                images.isEmpty) {
                              null;
                            } else {
                              defect.description = messageController.text;
                              defect.rollId = package.packageId!;
                              package.status = "С дефектом" ;
                              Service.saveDefect(defect, images);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Сохранить",
                            style: TextStyle(color: Colors.white),
                          ),
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
}
