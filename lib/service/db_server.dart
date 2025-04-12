// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/data/medicine_data.dart';
import 'dart:convert';

const int successfullyGetDataCode = 200;

Future<http.Response> getMedicineData() async {
  final response = await http.get(
    Uri.parse(
      'https://port-0-pharmesan-be-m9b5f19i30884436.sel4.cloudtype.app/drug/search?itemName=약',
    ), // json
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

Future<List<MedicineData>> fetchMedicineDataByName(
  String searchSentence,
) async {
  final response = await http.get(
    Uri.parse(
      'https://port-0-pharmesan-be-m9b5f19i30884436.sel4.cloudtype.app/drug/search?itemName=$searchSentence',
    ),
    headers: {'Content-Type': 'application/json'},
  );

  debugPrint("response 생성");

  if (response.statusCode == successfullyGetDataCode) {
    debugPrint("200 OK");
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => MedicineData.fromJson(data)).toList();
  } else {
    throw Exception('데이터를 불러올 수 없습니다');
  }
}
