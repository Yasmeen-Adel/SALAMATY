import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/small_app_button.dart';
import 'package:salamaty/features/onboarding/presentation/view/widgets/onboarding_main_screen.dart';
import 'package:salamaty/features/splash/presentation/view/widgets/splash2_image.dart';
import 'package:salamaty/features/splash/presentation/view/widgets/splash2_text.dart';

class SplashScreenBody2 extends StatelessWidget {
  const SplashScreenBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Splash2Image(),
            const SizedBox(height: 30),
            const Splash2Text(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmallAppButton(
                  text: 'Next',
                  onPressed: () {
                    // Navigate to the next screen or perform an action
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const OnboardingMainScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
