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
        ],
      ),
    );
  }
}
