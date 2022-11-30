import 'package:flutter/material.dart';
import '../../helpers/theme/app_theme.dart';
import '../../model/supply/package_list_model.dart';
import '../../service/service.dart';
import '../scans/add/package_list_parameters.dart';
import '../sidebar_new/navigation_drawer.dart';

class ProductionTableWidget extends StatefulWidget {
  const ProductionTableWidget();

  @override
  State createState() => ProductionTableWidgetState();
}

class ProductionTableWidgetState extends State<ProductionTableWidget> {
  bool isSelected = false;
  late PackageList selectedPackage;
  Color buttonColor = AppTheme.colors.grey;
  int selectedIndex = 0;

  List<PackageList> futureData = [];

  @override
  void initState() {
    super.initState();
    Service.getPackagesInUse().then((certificatesFromServer) {
      setState(() {
        futureData = certificatesFromServer;
       // filteredPackages = futureData;
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
                        "В обработке",
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
                                          onTap: () {
                                            _navigateAndDisplaySelection(context, index);
                                          },
                                          title: Text(unwrapText(futureData[index].batch)),
                                          trailing: Icon(
                                            Icons.arrow_forward,
                                            color: AppTheme.colors.darkGradient,
                                            size: 16.0,
                                          ),
                                        ),
                                        Column(children: <Widget>[
                                          Row(children: <Widget>[
                                            Text(
                                              "Сертификат ${futureData[index].numberOfCertificate}, ",
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              unwrapText(futureData[index].supplier),
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ]),
                                        Row(children: <Widget>[
                                          Text(
                                            "Масса нетто ${futureData[index].weight?.round().toString()} кг,",
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            "  Ширина ${futureData[index].width?.round().toString()} мм",
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ])
                                          ])
                                        // Text(
                                        //   unwrapText(filteredPackages[index].supplier),
                                        //   style: const TextStyle(
                                        //     fontSize: 14.0,
                                        //     color: Colors.grey,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
            ]
        ),
      ));

  void actOnCellTap(Color newColor) {
    setState(() {
      buttonColor = newColor;
    });
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context, int index) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PackageListParametersPage(futureData[index], PackageListMode.inProduction)
          //if context.
        ));
    if (futureData[index].status == "С дефектом") {
      setState(() {
        futureData.removeAt(index);
      });
    }
  }

  String unwrapText(String? text) {
    if (text != null) {
      return text;
    } else {
      return "";
    }
  }
}
