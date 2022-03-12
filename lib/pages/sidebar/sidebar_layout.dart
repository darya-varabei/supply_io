import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply_io/pages/sidebar/sidebar.dart';

import '../my_accounts_page.dart';
import '../scans/main_scanner_page.dart';
import 'navigation_bloc.dart';

class SideBarLayout extends StatelessWidget {
  @override
  NavigationStates get initialState => MyAccountsPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(initialState),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}