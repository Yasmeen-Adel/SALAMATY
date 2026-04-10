import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/detected_list_section.dart';

class DetectedMedicineBody extends StatelessWidget {
  const DetectedMedicineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            //arrow back , titl ,subtitle ...................................................
            // MedicineAlternativesHeaderSection(),
            SizedBox(
              height: 60,
            ),
            ArrowBack(),
            CustomScreenTitle(title: 'Detected Medicine'),
            SizedBox(
              height: 5,
            ),
            CustomScreenSubtitle(
                subtitleText:
                    'Here are some alternatives for the medicine you are looking for'),
            DetectedListSection(),
          ],
        ),
      ),
    );
  }
}
