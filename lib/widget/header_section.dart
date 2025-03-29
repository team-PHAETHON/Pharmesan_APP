import 'package:flutter/material.dart';
import 'package:myapp/screens/medicine_information_screen.dart';
import 'searching_bar.dart';

const double leftPadding = 30;
const double topPadding = 80;
const double rightPadding = 0;
const double bottomPadding = 50;
const double rateOfHeaderHeight = 0.35;
const double titleFontSize = 28;
const double headerWidth = 300;
const int mainThemeColor = 0xff578FCA;

class HeaderSection extends StatelessWidget {
  final Size size;
  final ValueChanged<String> onTextChanged;

  const HeaderSection({required this.size, required this.onTextChanged});

  void _navigateToSearchResult(BuildContext context, String searchQuery) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => MedicineInformationScreen(medicineName: searchQuery), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * rateOfHeaderHeight,
      width: double.infinity,
      child: Container(
        color: Color(mainThemeColor),
        width: headerWidth,
        padding: EdgeInsets.fromLTRB(
          leftPadding,
          topPadding,
          rightPadding,
          bottomPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Pharmesan",
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SearchingBar(onSearch: (query) => _navigateToSearchResult(context, query)),
          ],
        ),
      ),
    );
  }
}
