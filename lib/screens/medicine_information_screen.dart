import 'package:flutter/material.dart';

const double leftPadding = 30;
const double topPadding = 80;
const double rightPadding = 0;
const double bottomPadding = 50;
const double rateOfHeaderHeight = 0.35;
const double titleFontSize = 28;
const double headerWidth = 300;
const int mainThemeColor = 0xff578FCA;

class MedicineInformationScreen extends StatefulWidget {
  @override
  _MedicineInformationScreenState createState() =>
      _MedicineInformationScreenState();
}

class _MedicineInformationScreenState extends State<MedicineInformationScreen> {
  final String medicineImageURL =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBgjfXhLFiTbASWw6Wz6o3ySlPhHPJdWis8A&s";

  final String medicineName = "약1";
  final String medicineDescription =
      "이 약은 티눈, 사마귀 치료에 사용됩니다.\n\n 사용방법 : 아침 저녁으로~~";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(leftPadding, topPadding, rightPadding, bottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PHAETHON",
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Color(mainThemeColor),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  medicineImageURL,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Text(
                    medicineName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(mainThemeColor),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Expanded(child: SingleChildScrollView(
              child: Text(
                medicineDescription,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              )
            ))
          ],
        ),
      ),
    );
  }
}
