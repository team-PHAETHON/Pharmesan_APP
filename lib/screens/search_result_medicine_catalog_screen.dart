import 'package:flutter/material.dart';
import 'package:myapp/color_theme/color_theme.dart';
import 'package:myapp/data/medicine_data.dart';
import 'package:myapp/widget/search_result_catalog.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          leading: const BackButton(color: Colors.grey),
          automaticallyImplyLeading: true,
          title: Text(""),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          scrolledUnderElevation: 0,
        ),
      ),
      body: Scaffold(
        backgroundColor: Color(ColorTheme.greyColor),
        body: SearchResultCatalog(medicines: medicines),
      ),
    );
  }
}
