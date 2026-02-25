import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DefaultTextStyle(
        style: AppTextStyles.bold40.copyWith(
          color: AppColors.primaryColor,
          letterSpacing: 2,
        ),
        child: AnimatedTextKit(
          key: UniqueKey(),
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(
              'SALAMATY',
              speed: const Duration(milliseconds: 390),
            ),
          ],
        ),
      ),
    );
  }
}
