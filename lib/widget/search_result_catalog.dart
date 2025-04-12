import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/data/medicine_data.dart';
import 'package:myapp/widget/medicine_card.dart';

class SearchResultCatalog extends StatefulWidget {
  const SearchResultCatalog({super.key, required this.medicines});

  final List<MedicineData> medicines;

  @override
  _SearchResultCatalog createState() => _SearchResultCatalog();
}

class _SearchResultCatalog extends State<SearchResultCatalog> {
  @override
  void initState() {
    super.initState();
    addDummy();
  }

  void addDummy() {
    for (var i = 1; i < 50; i++) {
      widget.medicines.add(
        MedicineData(id: i, name: "dummy + $i", description: "dummy"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widget.medicines.length,
      itemBuilder: (BuildContext context, int index) {
        return MedicineCard(medicine: widget.medicines[index]);
      },
    );
  }
}
