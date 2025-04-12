import 'package:flutter/material.dart';
import 'package:myapp/data/medicine_data.dart';

class MedicineCard extends StatelessWidget {
  final MedicineData medicine;
  const MedicineCard({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          /// TODO: add picture of medicine
          leading: FlutterLogo(size: 56.0),
          title: Text(
            medicine.name ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            medicine.description ?? '',
            style: TextStyle(fontSize: 15, color: Colors.grey), 
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
