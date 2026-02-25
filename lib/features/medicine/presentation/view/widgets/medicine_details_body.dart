import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/large_outlined_app_button.dart';
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          ArrowBack(),
          SizedBox(height: 10),
          MedicineImageSection(),
          SizedBox(height: 24),
          MedicineTitlePriceSection(),
          SizedBox(height: 16),
          MedicineDescriptionSection(),
          SizedBox(height: 16),
          MedicineSightEffectSection(),
          SizedBox(height: 30),
          MedicineActionsSection(),
          SizedBox(height: 10),
          //outlined button ..........................................................
          LargeOutlinedAppButton(text: 'Find Pharmacies', onPressed: () {}),
        ],
      ),
    );
  }
}
