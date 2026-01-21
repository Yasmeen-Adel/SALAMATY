import 'package:flutter/material.dart';

class SignInSubtitle extends StatelessWidget {
  const SignInSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'Please sign in to continue',
          style: TextStyle(
              color: Color(0x9E0D2D9E),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
