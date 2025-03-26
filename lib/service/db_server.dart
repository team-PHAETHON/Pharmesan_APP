// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;

Future<http.Response> getMedicineData() async {
  final response = await http.get(
    Uri.parse('https://practicespringboot-tdxsp.run.goorm.site/greet'), // json
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    print("200 OK");
    print(response);
    return response;
  } else {
    print("Error");
    throw Exception('Failed to load post list');
  }
  // get all post
}

Future<http.Response> getMedicineDataByName(String searchSentence) async {
  final response = await http.get(
    Uri.parse('https://practicespringboot-tdxsp.run.goorm.site/medicine/search?name=$searchSentence'), // json
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    print("200 OK");
    print(response);
    return response;
  } else {
    print("Error");
    throw Exception('Failed to load post list');
  }
  // get all post
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

