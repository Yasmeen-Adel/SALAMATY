import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/large_outlined_app_button.dart';
import 'package:salamaty/features/medicine/data/models/medicine_details_model.dart';
import 'medicine_image_section.dart';
import 'medicine_title_price_section.dart';
import 'medicine_description_section.dart';
import 'medicine_sight_effect_section.dart';
import 'medicine_actions_section.dart';

class MedicineDetailsBody extends StatelessWidget {
  final MedicineDetailsModel medicine;

  const MedicineDetailsBody({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const ArrowBack(),
          const SizedBox(height: 10),
          MedicineImageSection(imageUrl: medicine.imageUrl),
          const SizedBox(height: 24),
          MedicineTitlePriceSection(name: medicine.name, price: medicine.price),
          const SizedBox(height: 16),
          MedicineDescriptionSection(description: medicine.description),
          const SizedBox(height: 16),
          MedicineSightEffectSection(sideEffects: medicine.sideEffects),
          const SizedBox(height: 40),
          const MedicineActionsSection(),
          const SizedBox(height: 10),
          LargeOutlinedAppButton(text: 'Find Pharmacies', onPressed: () {}),
        ],
      ),
    );
  }
}
