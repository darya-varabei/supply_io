import 'package:flutter/material.dart';
import 'package:supply_io/pages/sidebar_new/navigation_drawer.dart';

import '../../helpers/theme/app_theme.dart';

class MyAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(40, 20, 40, 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: double.infinity,
                      alignment: Alignment.centerRight,
                      child: Row(children: <Widget>[
                        SizedBox(
                          width: 190,
                          child: Text(
                            "Аккаунт",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 28,
                                color: AppTheme.colors.darkGradient,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                    )),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Row(children: <Widget>[
                      Text(
                        "Имя",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        "Дарья",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Row(children: <Widget>[
                      Text(
                        "Фамилия",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        "Воробей",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Row(children: <Widget>[
                      Text(
                        "Эл. почта",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        "daria-vo@ramber.ru",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Row(children: <Widget>[
                      Text(
                        "Должность",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        "Директор",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                ),
              ])));
}
