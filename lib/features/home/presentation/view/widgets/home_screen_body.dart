import 'package:flutter/material.dart';
import 'package:salamaty/features/home/presentation/view/widgets/facilities_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/header_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/med_tips.dart';
import 'package:salamaty/features/specialities/presentation/view/widgets/specialities_scection.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderSection(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SpecialtiesSection(),
                MedTips(),
                SizedBox(height: 6),
                FacilitiesSection(),
                SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
