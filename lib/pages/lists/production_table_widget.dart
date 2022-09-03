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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => PackageListParametersPage(futureData[index], PackageListMode.inProduction)));
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
                                            "Масса нетто ${futureData[index].weight.toString()} кг,",
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            "  Ширина ${futureData[index].width.toString()} мм",
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
                          // return ListView.builder(
                          //     itemCount: data?.length,
                          //     itemBuilder: (context, position) {
                          //       return Card(
                          //         margin: const EdgeInsets.symmetric(
                          //             vertical: 10.0, horizontal: 2.0),
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(15.0),
                          //         ),
                          //         color: position == selectedIndex ? AppTheme.colors.grey : AppTheme.colors.white,
                          //         child: Padding(
                          //             padding: const EdgeInsets.all(1.0),
                          //             child: ListTile(
                          //               onTap: () {
                          //                 if (isSelected == true) {
                          //                   selectedIndex = position;
                          //                   isSelected = false;
                          //                   selectedPackage = data![position];
                          //                   actOnCellTap(AppTheme.colors.red);
                          //                 } else {
                          //                   selectedIndex = position;
                          //                   selectedPackage = data![position];
                          //                   isSelected = true;
                          //                   actOnCellTap(AppTheme.colors.grey);
                          //                 }
                          //               },
                          //               title: Text(data![position].batch!),
                          //               trailing: Icon(
                          //                 Icons.arrow_forward,
                          //                 color: AppTheme.colors.darkGradient,
                          //                 size: 20.0,
                          //               ),
                          //             )),
                          //       );
                          //     });
                      //  }

                        // return Flexible(
                        //     flex: 2,
                        //     child: Container(
                        //       padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        //       child: Column(children: <Widget>[
                        //         const CircularProgressIndicator(),
                        //         // FlatButton(
                        //         //   padding: const EdgeInsets.symmetric(
                        //         //       vertical: 13, horizontal: 26),
                        //         //   onPressed: () {
                        //         //     Navigator.push(
                        //         //         context,
                        //         //         MaterialPageRoute(
                        //         //             builder: (context) =>
                        //         //                 ReportdDefectPage(
                        //         //                     selectedPackage)));
                        //         //   },
                        //         //   child: const Text(
                        //         //     "Сообщить о дефекте",
                        //         //     style: TextStyle(color: Colors.white),
                        //         //   ),
                        //         //   color: isSelected
                        //         //       ? AppTheme.colors.blue
                        //         //       : AppTheme.colors.grey,
                        //         //   shape: const StadiumBorder(),
                        //         //),
                        //       ]
                        //       ),
                        //     ));
                     // }))
            ]
        ),
      ));

  void actOnCellTap(Color newColor) {
    setState(() {
      buttonColor = newColor;
    });
  }

  String unwrapText(String? text) {
    if (text != null) {
      return text;
    } else {
      return "";
    }
  }
}
