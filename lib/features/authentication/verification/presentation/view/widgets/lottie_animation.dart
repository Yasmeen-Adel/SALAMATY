import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({super.key, required this.animationUrl});

  final String animationUrl;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(

      animationUrl,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
      repeat: true,
    );
  }
}
