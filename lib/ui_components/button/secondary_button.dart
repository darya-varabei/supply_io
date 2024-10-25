import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/theme/app_theme.dart';

class SecondaryButton extends StatelessWidget {
  late String label;
  late EdgeInsets edgeInsets;

  SecondaryButton({
    required this.label,
    required this.edgeInsets
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: edgeInsets,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: AppTheme.colors.blue,
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {

      },
      child: Text(
        "Сообщить о дефекте",
        style: TextStyle(color: AppTheme.colors.blue),
      ),
    );
  }
}