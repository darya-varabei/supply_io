
import '../../model/supply_model.dart';
import 'package:http/http.dart' as http;

Future<SupplyLinkModel?> createUser(String url) async {
  final Uri apiUrl = Uri.parse("http://localhost:56488");

  final response = await http.post(apiUrl, body: {
    "url": url
  });

  if(response.statusCode == 200) {
    final String responseString = response.body;
print(responseString);
    return supplyLinkModelFromJson(responseString);
  } else {
    return null;
  }
}
