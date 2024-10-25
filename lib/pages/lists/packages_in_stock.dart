import 'package:flutter/material.dart';

import '../../helpers/theme/app_theme.dart';
import '../../model/supply/package_list_model.dart';
import '../../service/service.dart';
import '../scans/add/package_list_parameters.dart';
import '../sidebar_new/navigation_drawer.dart';
import '../widgets/debouncer.dart';

class PackagesInStockListPage extends StatefulWidget {

  const PackagesInStockListPage({Key? key}) : super(key: key);

  @override
  _PackagesInStockListPageState createState() =>
      _PackagesInStockListPageState();
}

class _PackagesInStockListPageState extends State<PackagesInStockListPage> {
  _PackagesInStockListPageState();

  final _debouncer = Debouncer(milliseconds: 500);
  List<PackageList> futureData = [];
  List<PackageList> filteredPackages = [];

  @override
  void initState() {
    super.initState();
    Service.getPackagesInStock().then((packagesFromServer) {
      setState(() {
        futureData = packagesFromServer;
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
                        .contains(string.toLowerCase())) ||
                    (unwrapText(u.supplier).toLowerCase()
                    .contains(string.toLowerCase())) ||
                    (unwrapText(u.weight?.round().toString())
                    .contains(string.toLowerCase())) ||
                    (unwrapText(u.width.toString())
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
                            _navigateAndDisplaySelection(context, index);
                    },
                      title: Text(unwrapText(filteredPackages[index].batch)),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: AppTheme.colors.darkGradient,
                        size: 16.0,
                      ),
                    ),
                    Column(children: [
                      Row(children: [
                        Text("Сертификат №${filteredPackages[index].numberOfCertificate}, ",
                      style: const TextStyle(
                        fontSize: 9.0,
                        color: Colors.grey,
                      ),
                    ),
                      Text(
                        "${filteredPackages[index].supplier}, ",
                        style: const TextStyle(
                          fontSize: 9.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],),
                      Row(children: <Widget>[
                        Text(
                          "Масса нетто ${filteredPackages[index].weight?.round()
                              .toString()} кг, ",
                          style: const TextStyle(
                            fontSize: 9.0,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Ширина ${filteredPackages[index].width?.round()
                              .toString()} мм",
                          style: const TextStyle(
                            fontSize: 9.0,
                            color: Colors.grey,
                          ),
                        ),
                      ])
                      ],
                    ),]
                  ),));
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

  Future<void> _navigateAndDisplaySelection(BuildContext context, int index) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PackageListParametersPage(filteredPackages[index], PackageListMode.inUse)
        ));
    if (filteredPackages[index].status == "В обработке" || filteredPackages[index].status == "С дефектом") {
      setState(() {
        filteredPackages.removeAt(index);
      });
    }
  }
}