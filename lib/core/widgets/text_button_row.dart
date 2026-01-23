import 'package:flutter/material.dart';

class TextButtonRow extends StatelessWidget {
  const TextButtonRow(
      {super.key,
      this.onSignUpPressed,
     required this.questionText, required this.textButton});

  final VoidCallback? onSignUpPressed;
  final String questionText;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           Text(
            questionText,
            style: TextStyle(
              color: Color(0x9E0D2D9E),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: onSignUpPressed,
            child: Text(
              textButton,
              style: TextStyle(
                color: Color(0xFF0D2D9E),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
