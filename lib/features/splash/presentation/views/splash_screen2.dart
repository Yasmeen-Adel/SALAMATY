import 'package:flutter/material.dart';
import 'package:salamaty/features/splash/presentation/views/widgets/splash_screen_body2.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  static const String routeName = 'splash2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreenBody2());
  }
}
