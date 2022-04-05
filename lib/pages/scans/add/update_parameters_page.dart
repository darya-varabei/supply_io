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
  _UpdateParametersPageState createState() => _UpdateParametersPageState(result: result, certificateId: certificateId);
}

class _UpdateParametersPageState extends State<UpdateParametersPage> {
  Package result;
  int certificateId;
  _UpdateParametersPageState({required this.result, required this.certificateId});

  // final gradeController = TextEditingController();
  // final weightController = TextEditingController();
  // final thicknessController = TextEditingController();
  // final widthController = TextEditingController();

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   gradeController.dispose();
  //   weightController.dispose();
  //   thicknessController.dispose();
  //   widthController.dispose();
  //   super.dispose();
  // }

  // @override
  // void onWidgetBuild() {
  //   gradeController.text = result.grade!;
  //   weightController.text = "${result.weight.gross}";
  //   thicknessController.text = "${result.size.thickness}";
  //   widthController.text = "${result.size.width}";
  // }

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
              child: Row(
                  children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PackageParametersPage(result, certificateId)));
                  },
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

                SizedBox(
                  width: 100,
                  child:TextField(

                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      hintText: '',
                    ),
                    onChanged: (text) {
                      result.grade = text;
                    },),),
                ]),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Row(children: <Widget>[
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
                    child:
                  TextField(
                    onChanged: (text) {
                      result.weight.gross = text as double;
                    },
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        hintText: '',
                      ),
                    ),),
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
                SizedBox(
                    width: 100,
                    child:
                  TextField(
                    onChanged: (text) {
                      result.size.thickness = text as double;
                    },
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        hintText: '',
                      ),
                    ),),
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
                SizedBox(
                    width: 100,
                    child:
                    TextField(
                      onChanged: (text) {
                        result.size.width = text as int ;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        hintText: '',
                      ),
                    ),),
                ]),
              ),
            ),
            Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Column(children: <Widget>[
                    FlatButton(
                      padding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 26),
                      onPressed: () {},
                      child: Text(
                        "Сохранить",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: AppTheme.colors.blue,//isSelected ? AppTheme.colors.blue : AppTheme.colors.grey,
                      shape: StadiumBorder(),
                    ),
                  ]),
                )),
      ])));
}
