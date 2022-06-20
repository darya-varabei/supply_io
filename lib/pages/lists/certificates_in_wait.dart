import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../helpers/theme/app_theme.dart';
import '../../model/supply/certificate_model.dart';
import '../../model/user/login_model.dart';
import '../sidebar_new/navigation_drawer.dart';
import '../sidebar_new/navigation_drawer.dart';
import '../widgets/debouncer.dart';

class CertificatesInWaitListPage extends StatefulWidget {

  CertificatesInWaitListPage( {Key? key}) : super(key: key);

  @override
  _CertificatesInWaitListPageState createState() =>
      _CertificatesInWaitListPageState();
}

class _CertificatesInWaitListPageState extends State<CertificatesInWaitListPage> {
  _CertificatesInWaitListPageState();
  final _debouncer = Debouncer(milliseconds: 500);
  late List<Certificate> futureData;
  late List<Certificate> filteredPackages;

  @override
  void initState() {
    super.initState();
    getPackagesInUse().then((certificatesFromServer) {
      setState(() {
        futureData = certificatesFromServer;
        filteredPackages = futureData;
      });
    });
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          drawer: const NavigationDrawer(),
          appBar: AppBar(
            backgroundColor: AppTheme.colors.darkGradient,
          ),
        body: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Идентификатор рулона',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    filteredPackages = futureData
                        .where((u) => (u.packages.map((c) => c.batch).toList()
                        .contains(string.toLowerCase())))
                        .toList();
                  });
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: filteredPackages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            unwrapText(filteredPackages[index].number),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            unwrapText(filteredPackages[index].date),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Future<List<Certificate>> getPackagesInUse() async {
    final Uri apiUrl = Uri.parse("https://192.168.8.138:44335/api/parcer/package?status=В%20обработке");
    String token = await getJwtOrEmpty();
    final response = await http.get(apiUrl, headers: {
      'access_token': token,
    });

    if (response.statusCode < 400) {
      final String responseString = response.body;
      var packageList = jsonDecode(responseString);//['packages'] as List;
      List<Certificate>? listDecoded = [];
      listDecoded = (json.decode(response.body) as List).map((i) =>
          Certificate.fromJson(i)).toList();
      return listDecoded;
    } else {
      return List.empty();
    }
  }

  Future<String> getJwtOrEmpty() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  String unwrapText(String? text) {
    if (text != null) {
      return text;
    } else {
      return "";
    }
  }
}