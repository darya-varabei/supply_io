import 'package:flutter/material.dart';
import 'package:supply_io/pages/lists/certificates_in_wait.dart';

import '../../helpers/theme/app_theme.dart';
import '../../model/user/login_model.dart';
import '../lists/production_table_widget.dart';
import '../scans/add/main_scanner_page.dart';
import '../scans/use/use_scan_page.dart';
import 'drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.5, 0.9],
              colors: [
                AppTheme.colors.darkGradient,
                AppTheme.colors.lightGradient
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.5, 0.9],
                colors: [
                  AppTheme.colors.darkGradient,
                  AppTheme.colors.lightGradient
                ],
              )),
              child: Column(
                children: [
                  //headerWidget(),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    thickness: 1,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DrawerItem(
                    name: 'Добавить по QR на упаковке',
                    icon: Icons.photo_camera,
                    onPressed: () => onItemPressed(context, index: 0),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DrawerItem(
                    name: 'Сохранить сертификат по QR',
                    icon: Icons.photo_album,
                    onPressed: () => onItemPressed(context, index: 1),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DrawerItem(
                      name: 'Отправить в обработку',
                      icon: Icons.photo_filter,
                      onPressed: () => onItemPressed(context, index: 2)),
                  const SizedBox(
                    height: 30,
                  ),
                  DrawerItem(
                      name: 'В обработке',
                      icon: Icons.list,
                      onPressed: () => onItemPressed(context, index: 3)),
                  const SizedBox(
                    height: 30,
                  ),
                  DrawerItem(
                      name: 'Сертификаты в ожидании',
                      icon: Icons.filter_list,
                      onPressed: () => onItemPressed(context, index: 4)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    thickness: 1,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DrawerItem(
                      name: 'Выйти',
                      icon: Icons.logout,
                      onPressed: () => onItemPressed(context, index: 5)),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MainPage(ScanOptions.package)));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MainPage(ScanOptions.certificate)));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const UseRollPage()));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const ProductionTableWidget()));
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const CertificatesInWaitListPage()));
        break;
      case 5:
        storage.write(key: "access_token", value: "");
        storage.write(key: "refresh_token", value: "");
        Navigator.of(context).popUntil((route) => route.isFirst);
        break;
    }
  }
}
