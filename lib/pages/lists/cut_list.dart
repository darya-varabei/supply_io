import 'package:flutter/material.dart';
import 'package:supply_io/service/service.dart';

import '../../helpers/theme/app_theme.dart';
import '../../model/supply/package_cut_model.dart';
import '../../model/supply/package_list_model.dart';
import '../sidebar_new/navigation_drawer.dart';
import 'cut_details_page.dart';

class CutTableWidget extends StatefulWidget {
  const CutTableWidget();

  @override
  State createState() => CutTableWidgetState();
}

class CutTableWidgetState extends State<CutTableWidget> {
  bool isSelected = false;
  late PackageList selectedPackage;
  Color buttonColor = AppTheme.colors.grey;
  int selectedIndex = 0;

  List<PackageCut> futureData = [];

  @override
  void initState() {
    super.initState();
    Service.getPackagesInCut().then((certificatesFromServer) {
      setState(() {
        futureData = certificatesFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: Column(children: <Widget>[
                  Text(
                    "Раскрой",
                    style: TextStyle(
                        fontSize: 28,
                        color: AppTheme.colors.darkGradient,
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: futureData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            ListTile(
  onTap: () async { await
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CutParametersPage(futureData[index])));
          if (futureData[index].status == "С дефектом" || futureData[index].status == "В обработке") {
            setState(() {
              futureData.removeAt(index);
            });
          }
      },
                              title: Text(futureData[index].batch),
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: AppTheme.colors.darkGradient,
                                size: 16.0,
                              ),
                            ),
                            Row(children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Сертификат №${futureData[index].numberOfCertificate}, ",
                                      style: const TextStyle(
                                        fontSize: 9.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${futureData[index].supplier}, ",
                                      style: const TextStyle(
                                        fontSize: 9.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ]),

                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Масса нетто ${futureData[index].weight?.round()
                                          .toString()} кг, ",
                                      style: const TextStyle(
                                        fontSize: 9.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "Ширина ${futureData[index].width?.round()
                                          .toString()} мм",
                                      style: const TextStyle(
                                        fontSize: 9.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ])
                            ],
                            ),
                          ],
                        ),
                      ),
                    );
                    // return ParametersCard(
                    //     package: futureData[index],
                    //     onTap: () async { await
                    //     Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => CutParametersPage(PackageCut())//PackageListParametersPage(
                    //                     //futureData[index], PackageListMode.inUse)
                    //             //));
                    //         if (futureData[index].status == "С дефектом") {
                    //           setState(() {
                    //             futureData.removeAt(index);
                    //           });
                    //         }
                    //     });
                  },
                ),
              )
            ]),
      ));

  Future<void> _navigateAndDisplaySelection(
      BuildContext context, int index) async {
    // final result = await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => CutParametersPage(
    //             futureData[index])
    //     ));
    // if (futureData[index].status == "С дефектом") {
    //   setState(() {
    //     futureData.removeAt(index);
    //   });
    // }
  }
}