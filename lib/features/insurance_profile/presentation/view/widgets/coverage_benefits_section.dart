import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/benefit_item.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class CoverageBenefitsSection extends StatelessWidget {
  const CoverageBenefitsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coverage & Benefits',
            style: AppTextStyles.semiBold20.copyWith(
              color: const Color(0xFF0D2D9E),
            ),
          ),
          const SizedBox(height: 8),
          BenefitItem(
            iconPath: 'assets/icons/medicines_icon.png',
            title: 'Medicines',
            items: const ['Prophine', 'Catafast', 'panadol'],
            isCovered: true,
          ),
          const SizedBox(height: 12),
          BenefitItem(
            iconPath: 'assets/icons/lab_tests_icon.png',
            title: 'Lab Tests',
            items: const ['Prophine', 'Catafast', 'panadol'],
            isCovered: true,
          ),
          const SizedBox(height: 12),
          BenefitItem(
            iconPath: 'assets/icons/hospitals_icon.png',
            title: 'Hospitals',
            items: const [],
            isCovered: true,
          ),
        ],
      ),
    );
  }
}
