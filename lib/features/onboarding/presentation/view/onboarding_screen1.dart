import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/widgets/small_app_button.dart';
import 'package:salamaty/core/widgets/small_outlined_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/onboarding/presentation/view/widgets/onboarding_subtitle.dart';
import 'package:salamaty/features/onboarding/presentation/view/widgets/onboarding_title.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen1 extends StatelessWidget {
  final PageController controller;

  const OnboardingScreen1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 80),
          Image.asset(
            'assets/images/onboarding1.png',
            width: 290,
            height: 290,
          ),
          const SizedBox(height: 15),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
              dotColor: Colors.grey,
              activeDotColor: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 40),
          const OnboardingTitle(
            onboardingTitle: 'Find the nearest pharmacies and hospitals.',
          ),
          const SizedBox(height: 20),
          const OnboardingSubtitle(
            onboardingSubtitle:
                'Quickly find the nearest pharmacies, hospitals, and labs based on your current location.',
          ),
         Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SmallOutlinedButton(
                text: 'Skip',
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, SignInScreen.routeName);
                },
              ),
              SmallAppButton(
                text: 'Next',
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
