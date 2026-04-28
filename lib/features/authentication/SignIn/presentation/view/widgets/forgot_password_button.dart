import 'package:flutter/material.dart';
import 'package:salamaty/generated/l10n.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 32),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            S.of(context).forgotPassword,
            style: TextStyle(
              color: Color(0xFF0D2D9E),
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
