import 'package:flutter/material.dart';
import 'widgets/medicine_alternatives_body.dart'; // تأكد من المسار الصحيح

class MedicineAlternativesScreen extends StatelessWidget {
  const MedicineAlternativesScreen({super.key});

  static const String routeName = 'medicine_alternatives';

  @override
  Widget build(BuildContext context) {
    return const MedicineAlternativesBody();
  }
}
