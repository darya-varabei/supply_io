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
        title: const Text("Alert Dialog Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Сертификат сохранен успешно"),
                        content: const Text("Для сохранения рулонов из сертификата перейдите на вкладку 'Сертификаты в ожидании'"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("ОК"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Show alert Dialog box"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}