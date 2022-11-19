import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/service/service.dart';

import '../../../helpers/theme/app_theme.dart';
import '../../sidebar_new/navigation_drawer.dart';

enum SingingCharacter { whole, part }

class UpdateUseParametersPage extends StatefulWidget {
  String? batch;
  int? packageId;
  double? width;
  double? weight;
  UpdateUseParametersPage(this.batch, this.packageId, this.width, this.weight,{Key? key}) : super(key: key);

  @override
  _UpdateUseParametersPageState createState() =>
      _UpdateUseParametersPageState(batch: batch, packageId: packageId, width: width, weight: weight);
}

class _UpdateUseParametersPageState extends State<UpdateUseParametersPage> {
  String? batch;
  int? packageId;
  double? width;
  double? weight;
  SingingCharacter? _character = SingingCharacter.whole;
  double selectedWeight = 0.0;
  double selectedWidth = 0.0;
  _UpdateUseParametersPageState({required this.batch, required this.packageId, required this.width, required this.weight});

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
                    Column(
                      children: <Widget>[
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
                              "Упаковка №${batch}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.colors.darkGradient,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ]),
                        ListTile(
                          title: const Text('Использовать весь рулон'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.whole,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Использовать часть рулона'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.part,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        Row(children: <Widget>[
                          Text(
                            "Используемая масса",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.colors.darkGradient.withOpacity(_character == SingingCharacter.part ? 1.0 : 0.5),
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: TextFormField(
                              initialValue: "${weight?.round()}",
                              enabled: _character == SingingCharacter.part ? true : false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 20, left: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                hintText: '',
                              ),
                              onChanged: (text) {
                                selectedWeight = double.parse(text);
                              },
                            ),
                          ),
                        ]),
                        const SizedBox(height: 20.0),
                        Row(children: <Widget>[
                          Text(
                            "Используемая ширина",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.colors.darkGradient.withOpacity(_character == SingingCharacter.part ? 1.0 : 0.5),
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: TextFormField(
                              initialValue: "${width?.round()}",
                              enabled: _character == SingingCharacter.part ? true : false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 20, left: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                hintText: '',
                              ),
                              onChanged: (text) {
                                selectedWidth = double.parse(text);
                              },
                            ),
                          ),
                        ]),
                        const SizedBox(height: 50.0),
                        Column(children: <Widget>[
                          FlatButton(
                            padding:
                            const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                            onPressed: () async {
                              if (selectedWeight <= weight!*1.0 && selectedWidth <= width!*1.0) {
                                var requestResult = Service.defineUseAction(
                                    _character!, packageId!, selectedWeight, selectedWidth);
                                if (requestResult == 404) {
                                  showMyDialog("Ошибка",
                                      "Не удается установить интернет соединение");
                                } else if (requestResult != null) {
                                  showMyDialog("Сохранено",
                                      "Сохранение выполнено успешно");
                                } else {
                                  showMyDialog(
                                      "Ошибка",
                                      "Не удается выполнить сохранение");
                                }
                              } else {
                                showMyDialog(
                                    "Ошибка",
                                    "Параметры введены неверно");
                              }
                            },
                            child: const Text(
                              "В обработку",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: AppTheme.colors.blue,
                            shape: const StadiumBorder(),
                          ),
                          //const SizedBox(height: 70.0),
                        ]),
                      ],
                    ),
                )
            )
        )
    );
  }
  Future<void> showMyDialog(String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Готово'),
              onPressed: () {
                if (title == "Сохранено") {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}