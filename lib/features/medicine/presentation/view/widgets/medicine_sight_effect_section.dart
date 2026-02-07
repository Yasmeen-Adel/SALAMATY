import 'package:flutter/material.dart';

class MedicineSightEffectSection extends StatelessWidget {
  const MedicineSightEffectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Sight Effect',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0D2D9E),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'This medicine may cause temporary blurred vision or eye discomfort '
            'in some patients. If symptoms persist, consult a doctor.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Color(0xFF404040),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
