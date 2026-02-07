import 'package:flutter/material.dart';
import 'widgets/medicine_details_body.dart';

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key});

  static const String routeName = 'medicine_details';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: MedicineDetailsBody(),
      ),
    );
  }
}
