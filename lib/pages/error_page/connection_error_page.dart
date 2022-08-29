import 'package:flutter/material.dart';

import '../../helpers/theme/app_theme.dart';

class ConnectionErrorPage extends StatelessWidget {
  const ConnectionErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: Column(children: <Widget>[
            Flexible(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Column(children: <Widget>[
                    SizedBox(
                      width: 190,
                      child: Text(
                        "Отсутствует интернет-соединение",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 190,
                      child: Text(
                        "Убедитесь, что интернет-соединение стабильно и перезагрузите приложение",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ]),
                )),
          ])));
}
