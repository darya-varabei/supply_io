import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  late String label;
  late EdgeInsets edgeInsets;

  PrimaryButton({
    required this.label,
    required this.edgeInsets
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
        padding: edgeInsets,
    backgroundColor: AppTheme.colors.blue,
    shape: StadiumBorder()),
    onPressed: () {
    },
    child: Text(
    label,
    style: const TextStyle(color: Colors.white),
    )
    );
  }
}