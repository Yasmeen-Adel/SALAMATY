import 'package:flutter/material.dart';

class MedicineDescriptionSection extends StatelessWidget {
  const MedicineDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Paracetamol is used to relieve mild to moderate pain and reduce fever. '
        'It is commonly used for headaches, toothache, muscle pain, and colds.',
        style: TextStyle(
          fontSize: 17,
          height: 1.5,
          color: Color(0xFF404040),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
