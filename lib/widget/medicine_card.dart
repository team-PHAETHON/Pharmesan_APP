import 'package:flutter/material.dart';
import 'package:myapp/data/medicine_data.dart';

const double titleTextSize = 20;
const double descriptionTextSize = 15;
const double cornerRadius = 15.0;
const String noData = '';
const double medicinePictureSize = 56.0;

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
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: ListTile(
          /// TODO: add picture of medicine
          leading: FlutterLogo(size: medicinePictureSize),
          title: Text(
            medicine.name ?? noData,
            style: TextStyle(
              fontSize: titleTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            medicine.description ?? noData,
            style: TextStyle(fontSize: descriptionTextSize, color: Colors.grey),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
