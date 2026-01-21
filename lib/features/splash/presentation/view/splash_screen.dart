import 'package:flutter/material.dart';
import 'package:salamaty/features/splash/presentation/view/widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreenBody());
  }
}

