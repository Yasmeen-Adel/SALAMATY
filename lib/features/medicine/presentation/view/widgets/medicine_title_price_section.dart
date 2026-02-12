import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class MedicineTitlePriceSection extends StatelessWidget {
  const MedicineTitlePriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Paracetamol',
            style: AppTextStyles.semiBold24.copyWith(
              color: const Color(0xFF0D2D9E),
            ),
          ),
          Text(
            '13.12\$',
            style: AppTextStyles.semiBold20.copyWith(
              color: const Color(0xFF0D2D9E),
            ),
          ),
        ],
      ),
    );
  }
}
