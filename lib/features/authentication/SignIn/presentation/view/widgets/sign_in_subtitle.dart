import 'package:flutter/material.dart';

class SignInSubtitle extends StatelessWidget {
  const SignInSubtitle({super.key, required this.subtitleText});

  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          subtitleText,
          style: TextStyle(
              color: Color(0x9E0D2D9E),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
