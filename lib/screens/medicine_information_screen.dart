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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * rateOfHeaderHeight,
        width: double.infinity,
        child: Container(
          color: Colors.white,
          width: headerWidth,
          padding: EdgeInsets.fromLTRB(
            leftPadding,
            topPadding,
            rightPadding,
            bottomPadding,
          ),
          child: Text(
            "Pharmesan",
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Color(mainThemeColor),
              ),
            ),
          ),
        ),
      );
  }
}
