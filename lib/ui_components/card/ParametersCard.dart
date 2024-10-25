import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../helpers/theme/app_theme.dart';
import '../../model/supply/package_list_model.dart';

class ParametersCard extends StatelessWidget {
  late PackageList package;
  final AsyncCallback onTap;

  ParametersCard({
    required this.onTap,
    required this.package
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                ListTile(
                  onTap: () {
                    onTap;
                  },
                  title: Text(unwrapText(package.batch)),
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
                      Text("Сертификат №${package.numberOfCertificate}, ",
                        style: const TextStyle(
                          fontSize: 9.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "${package.supplier}, ",
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
                      "Масса нетто ${package.weight?.round()
                          .toString()} кг, ",
                      style: const TextStyle(
                        fontSize: 9.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Ширина ${package.width?.round()
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
    ); // <== The Card class constructor
  }

  String unwrapText(String? text) {
    if (text != null) {
      return text;
    } else {
      return "";
    }
  }
}