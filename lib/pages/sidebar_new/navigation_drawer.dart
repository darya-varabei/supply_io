import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/pages/scans/add/package_parameters.dart';

import '../../helpers/theme/app_theme.dart';
import '../lists/production_table_widget.dart';
import '../lists/scan_result_list.dart';
import '../scans/add/main_scanner_page.dart';
import '../scans/use/use_scan_page.dart';
import '../user/my_accounts_page.dart';
import 'drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Container (
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [
        0.5,
        0.9
        ],
        colors: [
        AppTheme.colors.darkGradient,
        AppTheme.colors.lightGradient
        ],

    ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Container (
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.5,
                    0.9
                  ],
                  colors: [
                    AppTheme.colors.darkGradient,
                    AppTheme.colors.lightGradient
                  ],
                )
            ),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 40,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 40,),
              DrawerItem(
                name: 'Добавить по QR',
                icon: Icons.people,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Использовать по QR',
                  icon: Icons.account_box_rounded,
                  onPressed: ()=> onItemPressed(context, index: 1)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'В обработке',
                  icon: Icons.message_outlined,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Аккаунт',
                  icon: Icons.favorite_outline,
                  onPressed: ()=> onItemPressed(context, index: 3)
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Выйти',
                  icon: Icons.settings,
                  onPressed: ()=> onItemPressed(context, index: 4)
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));//PackageParametersPage()));//MainPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => UseRollPage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductionTableWidget()));//ScanResultListPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountsPage()));//ProductionTableWidget()));
    }
  }

  Widget headerWidget() {
    const url = 'https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo=';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Дарья Воробей', style: TextStyle(fontSize: 14, color: AppTheme.colors.white)),
            SizedBox(height: 10,),
            Text('daria-vo@rambler.ru', style: TextStyle(fontSize: 14, color: AppTheme.colors.white))
          ],
        )
      ],
    );
  }
}
