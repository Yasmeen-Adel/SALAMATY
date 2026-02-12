import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class MedicineSightEffectSection extends StatelessWidget {
  const MedicineSightEffectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Side effect',
            style: AppTextStyles.semiBold18.copyWith(
              color: Color(0xFF0D2D9E),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'commonly used for headaches, toothache, muscle pain, and colds.',
            style: AppTextStyles.regular14.copyWith(
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}
