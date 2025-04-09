import 'package:flutter/material.dart';
import 'package:myapp/data/medicine_data.dart';

class MedicineCard extends StatelessWidget {
  final MedicineData medicine;
  const MedicineCard({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(medicine.name ?? ''),
        subtitle: Text(medicine.description ?? ''),
      ),
    );
  }
}
