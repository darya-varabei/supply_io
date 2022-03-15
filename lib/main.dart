import 'package:flutter/material.dart';
import 'package:supply_io/pages/user/login_page.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
        home: LoginPage());
  }
}
