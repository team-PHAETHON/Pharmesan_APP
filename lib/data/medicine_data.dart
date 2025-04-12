import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicineData {
  final int id;
  final String? name;
  final String? description;

  MedicineData({required this.id, this.name, this.description});

  factory MedicineData.fromJson(Map<String, dynamic> json) {
    return MedicineData(
      id: json['id'],
      name: json['itemName'],
      description: json['itemImage'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'itemName': name,
    'itemImage': description,
  };

  /// TODO: Delete this function
  Future<MedicineData?> getMedicineDataByName(String searchSentence) async {
    final response = await http.get(
      Uri.parse(
        'https://practicespringboot-tdxsp.run.goorm.site/drug/search?itemName=$searchSentence'
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return MedicineData.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
