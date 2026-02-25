import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
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
          //arrow back , title ...................................................
          SizedBox(
            height: 60,
          ),
          ArrowBack(),
          CustomScreenTitle(title: 'Insurance Profile'),
          SizedBox(height: 30),
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
