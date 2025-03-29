import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicineData {
  final String? id;
  final String? name;
  final String? description;

  MedicineData({required this.id, this.name, this.description});

  factory MedicineData.fromJson(Map<String, dynamic> json) {
    return MedicineData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };

  Future<MedicineData?> getMedicineDataByName(String searchSentence) async {
    final response = await http.get(
      Uri.parse(
        'https://practicespringboot-tdxsp.run.goorm.site/medicine/search?name=$searchSentence',
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
