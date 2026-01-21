import 'package:flutter/material.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({super.key, this.onSignUpPressed});

  final VoidCallback? onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(
            color: Color(0x9E0D2D9E),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onSignUpPressed,
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xFF0D2D9E),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
