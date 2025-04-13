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
}
