import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supply_io/helpers/literals.dart';
import 'package:supply_io/pages/scans/add/main_scanner_page.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';
import '../../model/user/login_model.dart';
import '../../helpers/animated_items/progressHUD.dart';
import '../../model/user/user_model.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserData userData = UserData();

  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = const SnackBar(content: Text("Ошибка ввода"));

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel(password: '', email: '');
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Center(
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
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: const Offset(0, 10),
                            blurRadius: 20)
                      ],
                    ),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 25),
                          Text(
                            "SupplyIO",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (input) =>
                                loginRequestModel.email = input,
                            //input,
                            validator: (input) => !input!.contains('@')
                                ? "Неверный формат"
                                : null,
                            decoration: InputDecoration(
                              hintText: "Электронная почта",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.colors.darkGradient
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.colors.darkGradient)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: AppTheme.colors.darkGradient,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            style:
                                TextStyle(color: AppTheme.colors.darkGradient),
                            keyboardType: TextInputType.text,
                            onChanged: (input) =>
                                loginRequestModel.password = input,
                            //input,
                            validator: (input) => input!.length < 3
                                ? "Пароль должен иметь более 8 символов"
                                : null,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: "Пароль",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.colors.darkGradient
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.colors.darkGradient)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppTheme.colors.darkGradient,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: AppTheme.colors.darkGradient
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          FlatButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 80),
                            onPressed: () async {
                              var jwt = await login();
                              if (jwt < 400) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage(ScanOptions.package)));
                              } else {
                                const snackBar =
                                    SnackBar(content: Text("Неверный ввод"));
                                scaffoldKey.currentState
                                    ?.showSnackBar(snackBar);
                              }
                              isApiCallProcess = false;
                            },
                            child: const Text(
                              "Войти",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: AppTheme.colors.blue,
                            shape: const StadiumBorder(),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      login();
    }
  }

  Future<int> login() async {
    final Uri apiUrl = Uri.parse('${Endpoint.baseUrl}${Endpoint.login}');
    final response1 = await http.post(apiUrl, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
    'login': loginRequestModel.email,
    'password': loginRequestModel.password
    }));
      Map<String, dynamic> responseMap = json.decode(response1.body);
      if (response1.statusCode < 300) {
        userData.addData(responseMap);
        storage.write(key: "access_token", value: userData.accessToken);
        storage.write(key: "refresh_token", value: userData.refreshToken);
      } else {
        if (responseMap.containsKey("message")) {
          scaffoldKey.currentState?.showSnackBar(snackBar);
        }
      }
      return response1.statusCode;
  }
}
