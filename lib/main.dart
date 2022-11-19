import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:supply_io/pages/error_page/connection_error_page.dart';
import 'package:supply_io/pages/scans/add/main_scanner_page.dart';
import 'package:supply_io/pages/user/login_page.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';
import 'package:supply_io/service/service.dart';
import 'helpers/portrait_mode.dart';
import 'model/user/login_model.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  const MyApp({Key? key}) : super(key: key);
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
              return const LoginPage();
            }
            if (widget.data != null) {
              return widget.data!;
            }
          }
          return const SplashScreen();
        }
      )
    );
  }

  Future<Widget> widgetChoice() async {
    bool? isUserLoggedIn = await Service.checkIfUserLogged();
    //if (!isUserLoggedIn) {
      return const LoginPage();
    //} else {
      return MainPage(ScanOptions.package);
  //  }
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/91771-spinning-circles-loading-animation.json'),
        nextScreen: const MyApp(),
      splashIconSize: 250,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(seconds: 2),
    );
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
