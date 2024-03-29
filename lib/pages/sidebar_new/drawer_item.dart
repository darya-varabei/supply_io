import 'package:flutter/material.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.name, required this.icon, required this.onPressed}) : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppTheme.colors.white,),
            const SizedBox(width: 40,),
            Text(name, style: const TextStyle(fontSize: 14, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}