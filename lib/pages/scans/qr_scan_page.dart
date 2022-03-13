
import '../../model/supply_model.dart';
import 'package:http/http.dart' as http;

Future<SupplyLinkModel?> createUser(String url) async {
  final Uri apiUrl = Uri.parse("https://localhost:7109");

  final response = await http.post(apiUrl, body: {
    "url": url
  });

  if(response.statusCode == 201) {
    final String responseString = response.body;

    return supplyLinkModelFromJson(responseString);
  } else {
    return null;
  }
}
