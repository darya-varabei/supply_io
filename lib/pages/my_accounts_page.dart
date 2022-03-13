import 'package:flutter/material.dart';
import 'package:supply_io/pages/sidebar_new/navigation_drawer.dart';

class MyAccountsPage extends StatelessWidget {//}with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return //Scaffold(
        //drawer: const NavigationDrawer(),
        Center(
      child: Text(
        "My Accounts",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
      //  )
  }
}