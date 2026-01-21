import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFF0D2D9E),
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/logo_google.svg',
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }
}
