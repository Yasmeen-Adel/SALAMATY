import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class MedicineDescriptionSection extends StatelessWidget {
  const MedicineDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Ibuprofen is used to relieve mild to moderate pain and reduce fever. It is',
        style: AppTextStyles.regular14.copyWith(
          color: const Color(0xFF000000),
        ),
      ),
    );
  }
}
