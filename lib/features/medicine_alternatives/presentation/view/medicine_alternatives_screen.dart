import 'package:flutter/material.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/medicine_alternatives_body.dart';

class MedicineAlternativesScreen extends StatelessWidget {
  const MedicineAlternativesScreen({super.key});

  static const String routeName = 'medicine-alternatives';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MedicineAlternativesBody(),
    );
  }
}
