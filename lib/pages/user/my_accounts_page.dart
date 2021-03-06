
import 'package:flutter/material.dart';
import 'package:supply_io/pages/sidebar_new/navigation_drawer.dart';

import '../../helpers/theme/app_theme.dart';
import '../../model/user/account_model.dart';

class MyAccountsPage extends StatelessWidget {
  Account? account = Account(username: "darysp", name: "Дарья", surname: "Воробей", email: "daria-vo@rambler.ru", position: "Директор");

  MyAccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
          child: Column(
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: double.infinity,
                      alignment: Alignment.centerRight,
                      child: Row(children: <Widget>[
                        const Text(""),
                        const Spacer(),
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
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: Row(children: <Widget>[
                      Text(
                        "Имя",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                       account!.name,// "Дарья",
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
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: Row(children: <Widget>[
                      Text(
                        "Фамилия",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        account!.surname,
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
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: Row(children: <Widget>[
                      Text(
                        "Эл. почта",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        account!.email,
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
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: Row(children: <Widget>[
                      Text(
                        "Должность",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        account!.position,
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
