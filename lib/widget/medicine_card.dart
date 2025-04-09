import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  const MedicineCard({
    super.key,
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(medicine.name),
        subtitle: Text(medicine.dosage),
      ),
    );
  }
}
