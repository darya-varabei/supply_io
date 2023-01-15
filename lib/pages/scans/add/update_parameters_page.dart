import 'package:flutter/material.dart';

import '../../../helpers/theme/app_theme.dart';
import '../../../model/supply/package_model.dart';
import '../../sidebar_new/navigation_drawer.dart';

class UpdateParametersPage extends StatefulWidget {
  Package result;
  String certificateId;

  UpdateParametersPage(this.result, this.certificateId, {Key? key}) : super(key: key);

  @override
  _UpdateParametersPageState createState() =>
      _UpdateParametersPageState(result: result, certificateId: certificateId);
}

class _UpdateParametersPageState extends State<UpdateParametersPage> {
  Package result;
  String certificateId;
  String bufferGrade = "";
  double bufferThickness = 0.0;
  int bufferWidth = 0;
  int bufferWeight = 0;

  _UpdateParametersPageState(
      {required this.result, required this.certificateId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: AppTheme.colors.darkGradient,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
                reverse: true,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                        "Сертификат №$certificateId",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20.0),
            Row(children: <Widget>[
              Text(
                "",
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
                        fontSize: 24,
                        color: AppTheme.colors.darkGradient,
                        fontWeight: FontWeight.w400),
                  ),]),
                  const SizedBox(height: 30.0),
                  Row(children: <Widget>[
                    Text(
                      "Марка стали",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.colors.darkGradient,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextFormField(
                        initialValue: result.grade,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 20, left: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: '',
                        ),
                        onChanged: (text) {
                          bufferGrade = text;
                        },
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20.0),
                  Row(children: <Widget>[
                    Text(
                      "Масса",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.colors.darkGradient,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextFormField(
                        initialValue: "${result.weight?.gross?.round()}",
                        onChanged: (text) {
                          bufferWeight = int.parse(text);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 20, left: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: '',
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20.0),
                  Row(children: <Widget>[
                    Text(
                      "Толщина",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.colors.darkGradient,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextFormField(
                        initialValue: "${result.size?.thickness}",
                        onChanged: (text) {
                          bufferThickness = double.parse(text);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 20, left: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: '',
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20.0),
                  Row(children: <Widget>[
                    Text(
                      "Ширина",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.colors.darkGradient,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextFormField(
                        initialValue: "${result.size?.width?.round()}",
                        onChanged: (text) {
                          bufferWidth = int.parse(text);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 20, left: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: '',
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 50.0),
                  Column(children: <Widget>[
                    // FlatButton(
                    //   padding:
                    //       const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    //   onPressed: () {
                    //     if (bufferGrade != "") {
                    //       result.grade = bufferGrade;
                    //     }
                    //     if (bufferWeight != 0.0) {
                    //       result.weight?.gross = bufferWeight * 1.0;
                    //     }
                    //     if (bufferThickness != 0.0) {
                    //       result.size?.thickness = bufferThickness;
                    //     }
                    //     if (bufferWidth != 0) {
                    //       result.size?.width = bufferWidth * 1.0;
                    //     }
                    //     Navigator.pop(context, result);
                    //   },
                    //   child: const Text(
                    //     "Сохранить",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   color: AppTheme.colors.blue,
                    //   shape: const StadiumBorder(),
                    // ),
                    const SizedBox(height: 50.0),
                  ]),
                ])),
          ),
        ));
  }
}
