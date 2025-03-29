import 'dart:convert';

MedicineData medicineDataFromJson(String str) => MedicineData.fromJson(json.decode(str));

String medicineDataToJson(MedicineData data) => json.encode(data.toJson());

class MedicineData {
  final String? id;
  final String? name;
  final String? description;

  MedicineData({required this.id, this.name, this.description});

  factory MedicineData.fromJson(Map<String, dynamic> json) {
    return MedicineData(id: json['id'], name: json['name'], description: json['description']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };
}
