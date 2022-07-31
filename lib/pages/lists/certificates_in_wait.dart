import 'package:flutter/material.dart';
import '../../helpers/theme/app_theme.dart';
import '../../model/supply/package_list_model.dart';
import '../../service/service.dart';
import '../scans/add/package_list_parameters.dart';
import '../sidebar_new/navigation_drawer.dart';
import '../widgets/debouncer.dart';

class CertificatesInWaitListPage extends StatefulWidget {

  const CertificatesInWaitListPage( {Key? key}) : super(key: key);

  @override
  _CertificatesInWaitListPageState createState() =>
      _CertificatesInWaitListPageState();
}

class _CertificatesInWaitListPageState extends State<CertificatesInWaitListPage> {
  _CertificatesInWaitListPageState();
  final _debouncer = Debouncer(milliseconds: 500);
  List<PackageList> futureData = [];
  List<PackageList> filteredPackages = [];

  @override
  void initState() {
    super.initState();
    Service.getCertificatesInWait().then((certificatesFromServer) {
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
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Идентификатор рулона',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    filteredPackages = futureData
                        .where((u) => (unwrapText(u.batch)
                        .contains(string.toLowerCase())))
                        .toList();
                  });
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: filteredPackages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PackageListParametersPage(filteredPackages[index])));
                            },
                            title: Text(unwrapText(filteredPackages[index].batch)),
                            trailing: Icon(
                              Icons.arrow_forward,
                              color: AppTheme.colors.darkGradient,
                              size: 16.0,
                            ),
                          ),
                          Text(
                            unwrapText(filteredPackages[index].supplier),
                            style: const TextStyle(
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

  String unwrapText(String? text) {
    if (text != null) {
      return text;
    } else {
      return "";
    }
  }
}