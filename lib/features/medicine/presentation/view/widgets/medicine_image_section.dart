import 'package:flutter/material.dart';

class MedicineImageSection extends StatelessWidget {
  const MedicineImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.42,
        decoration: BoxDecoration(
          color: const Color(0xFFE5E9F5),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/paracetamol.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
