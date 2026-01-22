import 'package:flutter/material.dart';

class ForgotPasswordTitle extends StatelessWidget {
  const ForgotPasswordTitle({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF0D2D9E),
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
