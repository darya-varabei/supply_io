import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  //final Function onTap;

  const MenuItem({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: AppTheme.colors.white,
              size: 24,
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              title!,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: AppTheme.colors.white),
            )
          ],
        ),
      ),
    );
  }
}