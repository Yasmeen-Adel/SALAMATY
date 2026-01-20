
import 'package:flutter/material.dart';

class BottomLeftCircle extends StatelessWidget {
  const BottomLeftCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -150,
      left: -150,
      child: Container(
        width: 400,
        height: 400,
        decoration: const BoxDecoration(
          color: Color(0xFF102AA1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
