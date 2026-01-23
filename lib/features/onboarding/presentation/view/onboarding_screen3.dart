import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/onboarding/presentation/view/widgets/onboarding_subtitle.dart';
import 'package:salamaty/features/onboarding/presentation/view/widgets/onboarding_title.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen3 extends StatelessWidget {
  final PageController controller;

  const OnboardingScreen3({super.key, required this.controller});
  static const String routeName = 'onboarding_screen3';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 80),
          Image.asset(
            'assets/images/onboarding3.png',
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
            onboardingTitle: 'Manage Your Insurance Easily.',
          ),
          const SizedBox(height: 20),
          const OnboardingSubtitle(
            onboardingSubtitle:
                'Quickly find medical facilities that accept your insurance for fast and easy access.',
          ),
          Spacer(),
          LargeAppButton(
            text: 'Get Started',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, SignInScreen.routeName, (route) => false);
            },
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     SmallOutlinedButton(
          //       text: 'Skip',
          //       onPressed: () {
          //         Navigator.pushReplacementNamed(
          //             context, SignInScreen.routeName);
          //       },
          //     ),
          //     SmallAppButton(
          //       text: 'Next',
          //       onPressed: () {
          //         controller.nextPage(
          //           duration: const Duration(milliseconds: 400),
          //           curve: Curves.easeInOut,
          //         );
          //       },
          //     ),
          //   ],
          // ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
