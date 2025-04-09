// Suggested code may be subject to a license. Learn more: ~LicenseLog:2501771215.
import 'package:flutter/material.dart';
import 'package:myapp/data/medicine_data.dart';

class SearchResultMedicineCatalogScreen extends StatefulWidget {
  @override
  _SearchResultMedicineCatalogScreen createState() =>
      _SearchResultMedicineCatalogScreen();
}

class _SearchResultMedicineCatalogScreen
    extends State<SearchResultMedicineCatalogScreen> {
  final List<MedicineData> medicines = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color(0xffDFDFDF),
        elevation: 0,
      ),
      body: ListView(),
    );
  }
}
