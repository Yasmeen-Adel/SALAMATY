import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_Button.dart';
import 'package:salamaty/core/widgets/outlined_large_button.dart';

class MedicineActionsSection extends StatelessWidget {
  const MedicineActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          LargeAppButton(
            text: 'Save to Favorite',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          OutlinedLargeButton(
            text: 'See Alternatives',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
