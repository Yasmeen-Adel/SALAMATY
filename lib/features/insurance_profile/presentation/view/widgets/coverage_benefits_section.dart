import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/benefit_item.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/generated/l10n.dart';

class CoverageBenefitsSection extends StatelessWidget {
  final CoverageInfo coverage;
  const CoverageBenefitsSection({super.key, required this.coverage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // 'Coverage & Benefits',
            S.of(context).coverageBenefits,
            style: AppTextStyles.semiBold20.copyWith(
              color: const Color(0xFF0D2D9E),
            ),
          ),
          const SizedBox(height: 8),
          BenefitItem(
            iconPath: Icon(Icons.medical_services_outlined,
                color: AppColors.primaryColor, size: 26),
            title: S.of(context).medicines,
            items: coverage.medicines.items,
            isCovered: coverage.medicines.isCovered,
          ),
          const SizedBox(height: 12),
          BenefitItem(
            iconPath: Icon(Icons.science_outlined,
                color: AppColors.primaryColor, size: 26),
            title: S.of(context).labTests,
            items: coverage.labTests.items,
            isCovered: coverage.labTests.isCovered,
          ),
          const SizedBox(height: 12),
          BenefitItem(
            iconPath: Icon(Icons.local_hospital_outlined,
                color: AppColors.primaryColor, size: 26),
            title: S.of(context).hospitals,
            items: coverage.hospitals.items,
            isCovered: coverage.hospitals.isCovered,
          ),
        ],
      ),
    );
  }
}