import 'package:flutter/material.dart';

class Splash2Image extends StatelessWidget {
  const Splash2Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/splash2.png',
        height: 300,
        width: 320,
      ),
    );
  }
}
