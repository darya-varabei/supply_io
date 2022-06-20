import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertConfirmation extends StatefulWidget {
  const AlertConfirmation({required Key key}) : super(key: key);

  @override
  _AlertConfirmationState createState() => _AlertConfirmationState();
}

class _AlertConfirmationState extends State<AlertConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Сертификат сохранен успешно"),
                        content: Text("Для сохранения рулонов из сертификата перейдите на вкладку 'Сертификаты в ожидании'"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("ОК"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Show alert Dialog box"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}