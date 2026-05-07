

import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/features/insurance_profile/data/models/insurance_profile_model.dart';

class InsuranceProviderCard extends StatelessWidget {
  final ProviderInfo provider;
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
            style: AppTextStyles.semiBold20.copyWith(
              color: const Color(0xFF0D2D9E),
            ),
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
                _buildLogo(),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // اسم الـ provider
                      Text(
                        provider.name,
                        style: AppTextStyles.medium20.copyWith(
                          color: Colors.black,
                        ),
                      ),

                      // Policy Number
                      if (provider.policyNumber != null &&
                          provider.policyNumber!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Policy: ${provider.policyNumber}',
                          style: AppTextStyles.regular12.copyWith(
                            color: const Color(0xFF989898),
                          ),
                        ),
                      ],

                      // Valid Until
                      if (provider.validUntil != null &&
                          provider.validUntil!.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Valid until: ${provider.validUntil}',
                          style: AppTextStyles.regular12.copyWith(
                            color: const Color(0xFF989898),
                          ),
                        ),
                      ],

                      // Status (نفس الشكل)
                      if (provider.status != null &&
                          provider.status!.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Status: ${provider.status}',
                          style: AppTextStyles.regular12.copyWith(
                            color: const Color(0xFF989898),
                          ),
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

  Widget _buildLogo() {
    if (provider.logoUrl != null && provider.logoUrl!.startsWith('http')) {
      return ClipRRect(
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
      );
    }
    return Icon(
      Icons.health_and_safety_outlined,
      color: AppColors.primaryColor,
      size: 40,
    );
  }
}
