import 'package:flutter/material.dart';

class Splash2Text extends StatelessWidget {
  const Splash2Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rich Text: Welcome to Salamaty
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
            children: [
              TextSpan(
                text: 'Welcome to ',
                style: TextStyle(letterSpacing: 1.5, color: Colors.black),
              ),
              TextSpan(
                text: 'Salamaty',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 1.5,
                    color: Color(0xFF0D2D9E)),
              ),
            ],
          ),
        ),

        SizedBox(height: 8),

        // Subtitle text
        Text(
          'We\'re excited to have you\nonboard.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.4,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
