
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_io/service/service.dart';

import '../../helpers/theme/app_theme.dart';
import '../../model/supply/package_cut_model.dart';
import '../../model/supply/package_in_use_model.dart';
import '../report_defect_page.dart';
import '../sidebar_new/navigation_drawer.dart';
import '../../../ui_components/parameterContainer/parameter_container.dart';

class CutParametersPage extends StatefulWidget {
  PackageCut package;

  CutParametersPage(this.package, {Key? key}) : super(key: key);

  @override
  _CutParametersPageState createState() =>
      _CutParametersPageState(package: package);
}

class _CutParametersPageState extends State<CutParametersPage> {
  PackageCut package;
  late PageController pageController;
  int currentPageValue = 0;

  _CutParametersPageState(
      {required this.package});

  void updateInformation(PackageCut updatedResult) {
    setState(() => package = updatedResult);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void getChangedPageAndMoveBar(int page) {
    setState(() {
      currentPageValue = page;
    });
  }

  void moveToSecondPage() async {
    PackageInUseModel packageInUse = PackageInUseModel(supplyDate: "", grade: package.grade, packageId: package.packageId, numberOfCertificate: package.numberOfCertificate,
        batch: package.batch, width: package.width, thickness: package.thickness, height: "",
        mill: "", coatingClass: "", sort: "", supplier: "", elongation: "", price: "", comment: "", status: package.status);
    final resultDef = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context) => ReportdDefectPage(packageInUse)),
    );
    if (packageInUse.status == "С дефектом") {
      setState(() {
        package.status = "С дефектом";
      });
      Navigator.pop(context, package);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.colors.darkGradient,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: MediaQuery.of(context).size.width - 80,
                  height: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Row(children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context, package);
                      },
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 190,
                      child: Text(
                        "Сертификат № ${package.numberOfCertificate}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.darkGradient,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ]),
                )),
            Flexible(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                  alignment: Alignment.centerRight,
                  child: Column(children: <Widget>[
                    Text(
                      package.batch,
                      style: TextStyle(
                          fontSize: 24,
                          color: AppTheme.colors.darkGradient,
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
                )),
            Flexible(
              flex: 6,
              child: PageView(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                },
                children: <Widget>[
                  detailsView(package),
                  cutDetailsView(package)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 2; i++)
                          if (i == currentPageValue) ...[
                            pageIndicator(true)
                          ] else
                            pageIndicator(false),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppTheme.colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        moveToSecondPage();
                      },
                      child: Text(
                        "Сообщить о дефекте",
                        style: TextStyle(color: AppTheme.colors.blue),
                      ),
                    ),
                  ]),
                )),
            Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppTheme.colors.blue,
                        shape: const StadiumBorder(),
                        padding:
                        const EdgeInsets.symmetric(vertical: 13, horizontal: 54),
                      ),
                      onPressed: () async {
                          package.status = "В обработке";
                          var requestResult = await Service.sendUseById(
                              package.packageId);
                          if (requestResult != null) {
                            showMyDialog("Сохранено",
                                "Рулон переведен в обработку");
                            Navigator.pop(context, package);
                          } else if (requestResult == 404) {
                            showMyDialog("Ошибка",
                                "Не удается установить интернет соединение");
                          } else {
                            showMyDialog("Ошибка",
                                "Не удается выполнить отправку в обработку");
                          }
                          Navigator.pop(context, package);
                      },
                      child: const Text(
                        "В обработку",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                )),
          ])));

  Future<void> showMyDialog(String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Готово'),
              onPressed: () {
                if (title == "Сохранено") {
                  Navigator.of(context).pop();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

Widget pageIndicator(bool isActive) {
  return Container(
    height: 10,
    width: 10,
    margin: const EdgeInsets.only(left: 10, right: 10),
    child: DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isActive ? AppTheme.colors.lightGradient : Colors.grey.shade300,
        borderRadius: const BorderRadius.all(
          Radius.elliptical(4, 4),
        ),
      ),
    ),
  );
}

Widget detailsView(PackageCut package) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ParametersContainer(name: "Марка стали", value: (package.grade ?? "") + " " + (package.destination ?? "")),
        ParametersContainer(name: "Производитель", value: package.supplier ?? ""),
        ParametersContainer(name: "Толщина", value: "${package.thickness}"),
        ParametersContainer(name: "Ширина", value: "${package.width?.round()}"),
        ParametersContainer(name: "Масса(брутто)", value: "${package.weight?.round()}"),
        ParametersContainer(name: "Масса(нетто)", value: "${package.net?.round()}"),
      ],
    ),
  );
}

Widget cutDetailsView(PackageCut package) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ParametersContainer(name: "Срок раскроя", value: package.cutDate.substring(0, 10)),
        ParametersContainer(name: "Количество лент", value:"${package.numOfRibbons}"),
        ParametersContainer(name: "Ширина лент", value: "${package.ribbonWidth}"),
        ParametersContainer(name: "", value: ""),
        ParametersContainer(name: "", value: ""),
        ParametersContainer(name: "", value: ""),
      ],
    ),
  );
}
