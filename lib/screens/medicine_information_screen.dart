import 'package:flutter/material.dart';
import 'package:myapp/data/medicine_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const double leftPadding = 30;
const double topPadding = 80;
const double rightPadding = 0;
const double bottomPadding = 50;
const double rateOfHeaderHeight = 0.35;
const double titleFontSize = 28;
const double headerWidth = 300;
const int mainThemeColor = 0xff578FCA;

class MedicineInformationScreen extends StatefulWidget {
  final String medicineName;

  MedicineInformationScreen({required this.medicineName});

  @override
  _MedicineInformationScreenState createState() =>
      _MedicineInformationScreenState();
}

class _MedicineInformationScreenState extends State<MedicineInformationScreen> {
  final String medicineImageURL =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBgjfXhLFiTbASWw6Wz6o3ySlPhHPJdWis8A&s";

  late Future<MedicineData?> _medicineData;

  @override
  void initState() {
    super.initState();
    _medicineData = fetchMedicineData(widget.medicineName);
  }

  Future<MedicineData?> fetchMedicineData(String name) async {
    final response = await http.get(
      Uri.parse(
        'https://practicespringboot-tdxsp.run.goorm.site/medicine/search?name=$name',
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData != null) {
        return MedicineData.fromJson(jsonData);
      }
    }
    return null;
  }

  // final String medicineName = "약1";
  // final String medicineDescription =
  //     "이 약은 티눈, 사마귀 치료에 사용됩니다.\n\n 사용방법 : 아침 저녁으로~~";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<MedicineData?>(
        future: _medicineData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("데이터를 불러올 수 없습니다"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("검색 결과가 없습니다."));
          }
          final data = snapshot.data!;

          return Padding(
            padding: EdgeInsets.fromLTRB(
              leftPadding,
              topPadding,
              rightPadding,
              bottomPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PHAETHON",
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Color(mainThemeColor),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      medicineImageURL,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        data.name ?? "이름 없음",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(mainThemeColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      data.description ?? "설명 없음",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
