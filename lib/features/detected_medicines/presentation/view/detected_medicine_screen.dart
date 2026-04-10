import 'package:flutter/material.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/detected_medicine_body.dart';

class DetectedMedicineScreen extends StatelessWidget {
  const DetectedMedicineScreen({super.key});

  static const String routeName = 'detected-medicine';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetectedMedicineBody(),
    );
  }
}
