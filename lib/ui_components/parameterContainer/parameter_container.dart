import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/theme/app_theme.dart';

class ParametersContainer extends StatelessWidget {
  late String name;
  late String value;

  ParametersContainer({
    required this.name,
    required this.value
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Row(children: <Widget>[
          Text(
            name,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 16,
                color: AppTheme.colors.darkGradient,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 16,
                color: AppTheme.colors.darkGradient,
                fontWeight: FontWeight.w400),
          ),
        ]),
      ),
    );
  }
}