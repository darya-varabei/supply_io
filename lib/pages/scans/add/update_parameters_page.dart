import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/pages/scans/add/package_parameters.dart';

import '../../../helpers/theme/app_theme.dart';
import '../../../model/supply/package_model.dart';
import '../../sidebar_new/navigation_drawer.dart';

class UpdateParametersPage extends StatefulWidget {
  @override
  Package result;
  int certificateId;

  UpdateParametersPage(this.result, this.certificateId);

  _UpdateParametersPageState createState() =>
      _UpdateParametersPageState(result: result, certificateId: certificateId);
}

class _UpdateParametersPageState extends State<UpdateParametersPage> {
  Package result;
  int certificateId;
String bufferGrade = "";
double bufferThickness = 0.0;
int bufferWidth = 0;
double bufferWeight = 0.0;
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //
                            //         // builder: (context) => PackageParametersPage(
                            //         //     result, certificateId)
                            //     )
                            // );
                          },
                        ),
                        Spacer(),
                        SizedBox(
                          width: 190,
                          child: Text(
                            "Сертификат №${certificateId}",
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
                        "${result.batch}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 24,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
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
                        Spacer(),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: TextFormField(
                            initialValue: result.grade,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  bottom: 20,
                                    left: 10
                                ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: '',
                            ),
                            onChanged: (text) {
                             // result.grade = text;
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
                        Spacer(),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: TextFormField(
                            initialValue: "${result.weight.gross}",
                            onChanged: (text) {
                             // result.weight.gross = double.parse(text);
                              bufferWeight = double.parse(text);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                bottom: 20,
                                  left: 10
                              ),
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
                        Spacer(),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: TextFormField(
                            initialValue: "${result.size.thickness}",
                            onChanged: (text) {
                             // result.size.thickness = double.parse(text);
                              bufferThickness = double.parse(text);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                bottom: 20,
                                  left: 10
                              ),
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
                        Spacer(),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: TextFormField(
                            initialValue: "${result.size.width}",
                            onChanged: (text) {
                              //result.size.width = int.parse(text);
                              bufferWidth = int.parse(text);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                bottom: 20,
                                left: 10
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: '',
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 50.0),
                      Column(children: <Widget>[
                        FlatButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                          onPressed: () {
                            if (bufferGrade != "") {
                            result.grade = bufferGrade;
                            }
                            if (bufferWeight != 0.0) {
                            result.weight.gross = bufferWeight;
                            }
                            if (bufferThickness != 0.0) {
                              result.size.thickness = bufferThickness;
                            }
                            if (bufferWidth != 0) {
                              result.size.width = bufferWidth;
                            }
                            Navigator.pop(context, result);
                          },
                          child: Text(
                            "Сохранить",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: AppTheme.colors.blue,
                          //isSelected ? AppTheme.colors.blue : AppTheme.colors.grey,
                          shape: StadiumBorder(),
                        ),
                        const SizedBox(height: 50.0),
                      ]),
                    ])),
        ),
            ));

  }
}
