// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:salamaty/core/utils/app_colors.dart';
// import 'package:salamaty/core/utils/app_text_styles.dart';

// class InsuranceProviderCard extends StatelessWidget {
//   const InsuranceProviderCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Insurance Provider',
//             style: AppTextStyles.semiBold20.copyWith(
//               color: const Color(0xFF0D2D9E),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(
//                 color: const Color(0xFF0D2D9E).withOpacity(0.25),
//                 width: 1.5,
//               ),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.health_and_safety_outlined,
//                     color: AppColors.primaryColor, size: 40),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Misr Life Insurance',
//                         style: AppTextStyles.medium20.copyWith(
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         'Policy: P123456789',
//                         style: AppTextStyles.regular12.copyWith(
//                           color: const Color(0xFF989898),
//                         ),
//                       ),
//                       const SizedBox(height: 2),
//                       Text(
//                         'Policy Number: Valid until 31 Dec 2027',
//                         style: AppTextStyles.regular12.copyWith(
//                           color: const Color(0xFF989898),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
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

class InsuranceProviderCard extends StatelessWidget {
  final ProfileProvider provider;

  const InsuranceProviderCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Insurance Provider',
            style: AppTextStyles.semiBold20
                .copyWith(color: const Color(0xFF0D2D9E)),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF0D2D9E).withOpacity(0.25),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                // لو فيه logo يعرضه، لو لأ يعرض icon
                if (provider.logoUrl != null && provider.logoUrl!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      provider.logoUrl!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.health_and_safety_outlined,
                        color: AppColors.primaryColor,
                        size: 40,
                      ),
                    ),
                  )
                else
                  Icon(Icons.health_and_safety_outlined,
                      color: AppColors.primaryColor, size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.name,
                        style: AppTextStyles.medium20
                            .copyWith(color: Colors.black),
                      ),
                      if (provider.policyNumber != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Policy: ${provider.policyNumber}',
                          style: AppTextStyles.regular12
                              .copyWith(color: const Color(0xFF989898)),
                        ),
                      ],
                      if (provider.validUntil != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Valid until: ${provider.validUntil}',
                          style: AppTextStyles.regular12
                              .copyWith(color: const Color(0xFF989898)),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}