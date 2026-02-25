import 'package:flutter/material.dart';

class SignInHeaderImage extends StatelessWidget {
  const SignInHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/autLogo.png',
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
    );
  }
}
