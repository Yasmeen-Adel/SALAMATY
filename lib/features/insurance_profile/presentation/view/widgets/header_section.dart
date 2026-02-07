import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, right: 20, bottom: 20),
      child: Row(
        children: [
          const ArrowBack(),
          const SizedBox(width: 8),
          const Text(
            'Insurance Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E40AF),
            ),
          ),
        ],
      ),
    );
  }
}
