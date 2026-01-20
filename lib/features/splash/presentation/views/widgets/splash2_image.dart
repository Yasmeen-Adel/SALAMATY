import 'package:flutter/material.dart';

class Splash2Image extends StatelessWidget {
  const Splash2Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/spalsh2.gif',
        height: 300,
        width: 350,
      ),
    );
  }
}
