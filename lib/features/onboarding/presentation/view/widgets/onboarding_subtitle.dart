import 'package:flutter/material.dart';

class OnboardingSubtitle extends StatelessWidget {
  const OnboardingSubtitle({super.key, required this.onboardingSubtitle});
  final String onboardingSubtitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      onboardingSubtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF989898),
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.60,
      ),
    );
  }
}
