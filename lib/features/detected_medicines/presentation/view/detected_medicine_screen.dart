import 'package:flutter/material.dart';
import 'widgets/detected_medicine_body.dart';

class DetectedMedicineScreen extends StatelessWidget {
  final dynamic data;
  static const String routeName = 'detected-medicine';

  const DetectedMedicineScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetectedMedicineBody(data: data),
    );
  }
}