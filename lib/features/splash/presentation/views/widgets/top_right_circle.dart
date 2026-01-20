import 'package:flutter/material.dart';

class TopRightCircle extends StatelessWidget {
  const TopRightCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -100,
      right: -100,
      child: Container(
        width: 240,
        height: 240,
        decoration: const BoxDecoration(
          color: Color(0xFF102AA1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
