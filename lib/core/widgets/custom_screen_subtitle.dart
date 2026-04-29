import 'package:flutter/material.dart';

class CustomScreenSubtitle extends StatelessWidget {
  const CustomScreenSubtitle({super.key, required this.subtitleText});

  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          textAlign: TextAlign.start,
          subtitleText,
          style: TextStyle(
            color: Color(0xFF989898),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
