import 'package:flutter/material.dart';
import 'medicine_image_section.dart';
import 'medicine_title_price_section.dart';
import 'medicine_description_section.dart';
import 'medicine_sight_effect_section.dart';
import 'medicine_actions_section.dart';

class MedicineDetailsBody extends StatelessWidget {
  const MedicineDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MedicineImageSection(),
          SizedBox(height: 24),
          MedicineTitlePriceSection(),
          SizedBox(height: 16),
          MedicineDescriptionSection(),
          SizedBox(height: 16),
          MedicineSightEffectSection(),
          SizedBox(height: 40),
          MedicineActionsSection(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
