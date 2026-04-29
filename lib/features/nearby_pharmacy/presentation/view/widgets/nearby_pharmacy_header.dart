import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';

class NearbyPharmacyHeader extends StatelessWidget {
  const NearbyPharmacyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 40, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 28,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(                          // ← ده اللي بيحل الـ overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                const Text(
                  'Nearby Pharmacies',
                  style: TextStyle(
                    fontSize: 24,            // ← كبّرت الفونت
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'A list of nearby pharmacies where you can buy medicines.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
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