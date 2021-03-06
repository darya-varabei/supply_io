import 'dart:io';

import 'package:flutter/material.dart';
import 'package:supply_io/pages/scans/add/main_scanner_page.dart';
import 'package:supply_io/pages/user/login_page.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';
import 'package:supply_io/service/service.dart';
import 'model/user/login_model.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Вход в аккаунт',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        primaryColor: AppTheme.colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: AppTheme.colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: AppTheme.colors.darkGradient),
        textTheme: TextTheme(
          headline1:
              TextStyle(fontSize: 22.0, color: AppTheme.colors.darkGradient),
          headline2: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppTheme.colors.darkGradient),
          bodyText1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            color: AppTheme.colors.darkGradient,
          ),
        ),
      ),
      home: FutureBuilder(
        future: widgetChoice(),
        builder: (BuildContext context, AsyncSnapshot<Widget> widget) {
          if(widget.connectionState == ConnectionState.done){
            if (!widget.hasData) {
              return const Center(
                  child: Text('No Data exists')
              );
            }
            if (widget.data != null) {
              return widget.data!;
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      )
      // home: FutureBuilder(
      //     future: Service.checkIfUserLogged(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData) return const CircularProgressIndicator();
      //       if (snapshot.data != "") {
      //         var str = snapshot.data;
      //         var jwt = str.toString().split(".");
      //
      //         if (snapshot == false) {
      //           return LoginPage();
      //         } else {
      //           var payload = json.decode(
      //               ascii.decode(base64.decode(base64.normalize(jwt[1]))));
      //           if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
      //               .isAfter(DateTime.now())) {
      //             return LoginPage();//MainPage();
      //           } else {
      //             return LoginPage();
      //           }
      //         }
      //       } else {
      //         return LoginPage();
      //       }
      //     }),
    );
  }

  Future<Widget> widgetChoice() async {
    bool? isUserLoggedIn = await Service.checkIfUserLogged();
    if (!isUserLoggedIn) {
      return const LoginPage();
    } else {
      return MainPage(ScanOptions.package);
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
