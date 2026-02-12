import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'widgets/medicine_details_body.dart';

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key});

  static const String routeName = 'medicine_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ArrowBack(),
            Expanded(
              child: MedicineDetailsBody(),
            ),
          ],
        ),
      ),
    );
  }
}
