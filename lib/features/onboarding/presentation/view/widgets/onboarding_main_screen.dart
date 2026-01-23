import 'package:flutter/material.dart';
import 'package:salamaty/features/onboarding/presentation/view/onboarding_screen1.dart';
import 'package:salamaty/features/onboarding/presentation/view/onboarding_screen2.dart';
import 'package:salamaty/features/onboarding/presentation/view/onboarding_screen3.dart';

class OnboardingMainScreen extends StatefulWidget {
  const OnboardingMainScreen({super.key});

  @override
  State<OnboardingMainScreen> createState() => _OnboardingMainScreenState();
}

class _OnboardingMainScreenState extends State<OnboardingMainScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                OnboardingScreen1(controller: _controller),
                OnboardingScreen2(controller: _controller),
                OnboardingScreen3(controller: _controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
