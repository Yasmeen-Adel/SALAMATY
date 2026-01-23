import 'package:flutter/material.dart';
import 'package:salamaty/features/home/presentation/view/widgets/header_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/products_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/services_section.dart';
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
          SizedBox(height: 6),
          ServicesSection(),
          SizedBox(height: 6),
          TrackMedsSection(),
          SizedBox(height: 6),
          ProductsSection(),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
