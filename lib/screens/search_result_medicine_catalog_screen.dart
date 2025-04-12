import 'package:flutter/material.dart';
import 'package:myapp/color_theme/color_theme.dart';
import 'package:myapp/data/medicine_data.dart';
import 'package:myapp/service/db_server.dart';
import 'package:myapp/widget/search_result_catalog.dart';

class SearchResultMedicineCatalogScreen extends StatefulWidget {
  final String medicineName;

  SearchResultMedicineCatalogScreen({required this.medicineName});

  @override
  _SearchResultMedicineCatalogScreen createState() =>
      _SearchResultMedicineCatalogScreen();
}

class _SearchResultMedicineCatalogScreen
    extends State<SearchResultMedicineCatalogScreen> {
  late Future<List<MedicineData>> _medicines;

  @override
  void initState() {
    super.initState();
    _medicines = fetchMedicineDataByName(widget.medicineName);
  }

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
        body: FutureBuilder<List<MedicineData>>(
          future: _medicines,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
              return Center(child: Text("에러가 발생했습니다."));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("검색결과가 존재하지 않습니다."));
            }

            return SearchResultCatalog(medicines: snapshot.data!);
          },
        ),
      ),
    );
  }
}
