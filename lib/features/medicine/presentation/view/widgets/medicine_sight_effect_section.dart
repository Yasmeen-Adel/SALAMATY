import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/generated/l10n.dart';

class MedicineSightEffectSection extends StatelessWidget {
  final String sideEffects;

  const MedicineSightEffectSection({
    super.key,
    required this.sideEffects,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // 'Side effect',
            S.of(context).sideEffect,
            style: AppTextStyles.semiBold18.copyWith(
              color: const Color(0xFF0D2D9E),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            sideEffects,
            style: AppTextStyles.regular14.copyWith(
              color: const Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}
