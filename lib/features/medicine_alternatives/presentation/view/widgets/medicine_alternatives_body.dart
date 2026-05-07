import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/alternatives_list_section.dart';
import 'package:salamaty/generated/l10n.dart';

class MedicineAlternativesBody extends StatelessWidget {
  const MedicineAlternativesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            //arrow back , titl ,subtitle ...................................................
            // MedicineAlternativesHeaderSection(),
            SizedBox(
              height: 60,
            ),
            ArrowBack(),
            CustomScreenTitle(title:S.of(context).medicineAlternatives),
            SizedBox(
              height: 5,
            ),
            CustomScreenSubtitle(
                subtitleText:
                    S.of(context).medicineAlternativesSubtitle),
            AlternativesListSection(),
          ],
        ),
      ),
    );
  }
}
