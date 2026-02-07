import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/header_section.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/user_info_card.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/insurance_provider_card.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/coverage_benefits_section.dart';

class InsuranceProfileBody extends StatelessWidget {
  const InsuranceProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderSection(),
          SizedBox(height: 20),
          UserInfoCard(),
          SizedBox(height: 16),
          InsuranceProviderCard(),
          SizedBox(height: 16),
          CoverageBenefitsSection(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
