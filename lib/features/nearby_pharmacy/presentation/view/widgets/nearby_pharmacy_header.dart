import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/generated/l10n.dart';

class NearbyPharmacyHeader extends StatelessWidget {
  const NearbyPharmacyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 40, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          ArrowBack(),

          CustomScreenTitle(title: S.of(context).nearbyPharmacies),
          CustomScreenSubtitle(
              subtitleText: S.of(context).nearbyPharmaciesSubtitle),
          // IconButton(
          //   onPressed: () => Navigator.pop(context),
          //   icon: const Icon(
          //     Icons.arrow_back_rounded,
          //     size: 28,
          //     color: AppColors.primaryColor,
          //   ),
          // ),
          // const SizedBox(width: 8),
          // Expanded(
          //   // ← ده اللي بيحل الـ overflow
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const SizedBox(height: 4),
          //       CustomScreenTitle(title: S.of(context).nearbyPharmacies),
          //  Text(
          //   // 'Nearby Pharmacies',
          //   S.of(context).nearbyPharmacies,
          //   style: TextStyle(
          //     fontSize: 24,            // ← كبّرت الفونت
          //     fontWeight: FontWeight.bold,
          //     color: AppColors.primaryColor,
          //   ),
          // ),
          // const SizedBox(height: 6),
          // Text(
          //   S.of(context).nearbyPharmaciesSubtitle,
          //   style: TextStyle(
          //     fontSize: 13,
          //     color: Colors.grey.shade600,
          //   ),
          // ),
          // CustomScreenSubtitle(
          //     subtitleText: S.of(context).nearbyPharmaciesSubtitle),
        ],
      ),
    );
  }
}
