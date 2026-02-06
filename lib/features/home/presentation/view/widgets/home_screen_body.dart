import 'package:flutter/material.dart';
import 'package:salamaty/features/home/presentation/view/widgets/facilities_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/header_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/products_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/services_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/specialties_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/track_meds_section.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderSection(),
          SpecialtiesSection(),
          TrackMedsSection(),
          SizedBox(height: 6),
          FacilitiesSection(),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
