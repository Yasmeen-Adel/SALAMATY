import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class SecondaryHeader extends StatelessWidget {
  const SecondaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Medical Center',
      style: AppTextStyles.small20.copyWith(
        color: AppColors.secondaryColor,
        letterSpacing: 1.5,
      ),
    );
  }
}
