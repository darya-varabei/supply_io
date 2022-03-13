import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/pages/scans/main_scanner_page.dart';
import 'package:supply_io/helpers/theme/app_theme.dart';
import 'package:supply_io/pages/sidebar_new/main_page.dart';

import '../helpers/api/api_service.dart';
import '../model/login_model.dart';
import '../helpers/animated_items/progressHUD.dart';
import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  UserData userData = new UserData();


  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text("Ошибка ввода"));
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
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
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppTheme.colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "SupplyIO",
                          style: Theme.of(context).textTheme.headline2,
                          //color: AppTheme.colors.darkGradient
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => loginRequestModel.email = "eve.holt@reqres.in",//input,
                          validator: (input) => !input!.contains('@')
                              ? "Неверный формат"
                              : null,
                          decoration: new InputDecoration(
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
                        SizedBox(height: 20),
                        new TextFormField(
                          style:
                          TextStyle(color: AppTheme.colors.darkGradient),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                          loginRequestModel.password = "cityslika",//input,
                          validator: (input) => input!.length < 3
                              ? "Password should be more than 3 characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
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
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 80),
                          onPressed: () {
                            //this.submit();
                            if (validateAndSave()) {
                              print(loginRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();
                              apiService.login(loginRequestModel).then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  if (value.token!.isNotEmpty) {
                                    final snackBar1 = SnackBar(
                                        content: Text("Вход выполнен успешно"));
                                    scaffoldKey.currentState
                                        ?.showSnackBar(snackBar1);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                      builder: (context) => MainPage(),
                                ),
                                    );
                                  } else {
                                    final snackBar =
                                    SnackBar(content: Text(value.error!));
                                    scaffoldKey.currentState
                                        ?.showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Войти",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: AppTheme.colors.blue,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15),
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
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      login();
    }
  }

  void login() async {
    final url = 'http://192.168.43.34:4000/users/authenticate';
    await http.post(Uri.parse(url), body: {'username': userData.email, 'password': base64Encode(userData.password.codeUnits)})
        .then((response) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      if(response.statusCode == 200) {
        userData.addData(responseMap);
        // Navigator.push(
        //   context,
          //MaterialPageRoute( builder: (context) => SideBarLayout(),),
        // );
      }
      else {
        if(responseMap.containsKey("message"))
        scaffoldKey.currentState
            ?.showSnackBar(snackBar);
      }
    }).catchError((err) {
      scaffoldKey.currentState
          ?.showSnackBar(snackBar);
      });
  }
}