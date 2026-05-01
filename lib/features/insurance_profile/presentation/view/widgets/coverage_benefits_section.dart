// import 'package:flutter/material.dart';
// import 'package:salamaty/core/utils/app_colors.dart';
// import 'package:salamaty/features/insurance_profile/presentation/view/widgets/benefit_item.dart';
// import 'package:salamaty/core/utils/app_text_styles.dart';

// class CoverageBenefitsSection extends StatelessWidget {
//   const CoverageBenefitsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Coverage & Benefits',
//             style: AppTextStyles.semiBold20.copyWith(
//               color: const Color(0xFF0D2D9E),
//             ),
//           ),
//           const SizedBox(height: 8),
//           BenefitItem(
//             iconPath: Icon(
//               Icons.medical_services_outlined,
//               color: AppColors.primaryColor,
//               size: 26,
//             ),
//             title: 'Medicines',
//             items: const ['Prophine', 'Catafast', 'panadol'],
//             isCovered: true,
//           ),
//           const SizedBox(height: 12),
//           BenefitItem(
//             iconPath: Icon(
//               Icons.science_outlined,
//               color: AppColors.primaryColor,
//               size: 26,
//             ),
//             title: 'Lab Tests',
//             items: const ['Prophine', 'Catafast', 'panadol'],
//             isCovered: true,
//           ),
//           const SizedBox(height: 12),
//           BenefitItem(
//             iconPath: Icon(
//               Icons.local_hospital_outlined,
//               color: AppColors.primaryColor,
//               size: 26,
//             ),
//             title: 'Hospitals',
//             items: const ['Prophine', 'Catafast', 'panadol'],
//             isCovered: true,
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/benefit_item.dart';

class CoverageBenefitsSection extends StatelessWidget {
  final Coverage coverage;
  final LabTests labTests;

  const CoverageBenefitsSection({
    super.key,
    required this.coverage,
    required this.labTests,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coverage & Benefits',
            style: AppTextStyles.semiBold20
                .copyWith(color: const Color(0xFF0D2D9E)),
          ),
          const SizedBox(height: 8),
          BenefitItem(
            iconPath: Icon(Icons.medical_services_outlined,
                color: AppColors.primaryColor, size: 26),
            title: 'Medicines',
            items: coverage.medicines.items,
            isCovered: coverage.medicines.isCovered,
          ),
          const SizedBox(height: 12),
          BenefitItem(
            iconPath: Icon(Icons.science_outlined,
                color: AppColors.primaryColor, size: 26),
            title: 'Lab Tests',
            items: labTests.items,
            isCovered: labTests.isCovered,
          ),
          const SizedBox(height: 12),
          BenefitItem(
            iconPath: Icon(Icons.local_hospital_outlined,
                color: AppColors.primaryColor, size: 26),
            title: 'Hospitals',
            items: coverage.hospitals.items,
            isCovered: coverage.hospitals.isCovered,
          ),
        ],
      ),
    );
  }
}