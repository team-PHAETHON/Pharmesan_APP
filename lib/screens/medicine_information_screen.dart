import 'package:flutter/material.dart';
import 'package:myapp/color_theme/color_theme.dart';
import 'package:myapp/data/medicine_data.dart';
import 'package:myapp/service/db_server.dart';

const double leftPadding = 30;
const double topPadding = 80;
const double rightPadding = 0;
const double bottomPadding = 50;
const double rateOfHeaderHeight = 0.35;
const double titleFontSize = 28;
const double headerWidth = 300;
const String medicineImageURL =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBgjfXhLFiTbASWw6Wz6o3ySlPhHPJdWis8A&s";
const String noNameText = "이름 없음";
const String noDescriptionText = "설명 없음";
const String errorInSearchingText = "데이터를 불러올 수 없습니다.";
const String noResult = "검색 결과가 없습니다.";
const double medicineNameTextSize = 22;
const double medicineDescriptionTextSize = 16;
const int successfullyGetDataCode = 200;

class MedicineInformationScreen extends StatefulWidget {
  final String medicineName;

  MedicineInformationScreen({required this.medicineName});

  @override
  _MedicineInformationScreenState createState() =>
      _MedicineInformationScreenState();
}

class _MedicineInformationScreenState extends State<MedicineInformationScreen> {
  late Future<List<MedicineData>> _medicineData;

  @override
  void initState() {
    super.initState();
    _medicineData = fetchMedicineDataByName(widget.medicineName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<MedicineData>>(
        future: _medicineData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return Center(child: Text(errorInSearchingText));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(noResult));
          }
          final data = snapshot.data!.first;

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
                    color: Color(ColorTheme.mainThemeBlueColor),
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
                        data.name ?? noNameText,
                        style: TextStyle(
                          fontSize: medicineNameTextSize,
                          fontWeight: FontWeight.bold,
                          color: Color(ColorTheme.mainThemeBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      data.description ?? noDescriptionText,
                      style: TextStyle(
                        fontSize: medicineDescriptionTextSize,
                        color: Colors.black87,
                      ),
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
