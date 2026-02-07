import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance/presentation/view/widgets/insurance_header_section.dart';
import 'package:salamaty/features/insurance/presentation/view/widgets/filter_tabs_section.dart';
import 'package:salamaty/features/insurance/presentation/view/widgets/nearby_services_section.dart';

class InsuranceServicesBody extends StatelessWidget {
  const InsuranceServicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            InsuranceHeaderSection(),
            SizedBox(height: 10),
            FilterTabsSection(),
            SizedBox(height: 10),
            NearbyServicesSection(),
          ],
        ),
      ),
    );
  }
}
