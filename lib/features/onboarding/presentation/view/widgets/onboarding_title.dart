import 'package:flutter/material.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({super.key, required this.onboardingTitle});
  final String onboardingTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      onboardingTitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF0D2D9E),
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.60,
      ),
    );
  }
}
