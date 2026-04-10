import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class MedicineTitlePriceSection extends StatelessWidget {
  final String name;
  final double price;

  const MedicineTitlePriceSection({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.semiBold24.copyWith(
                color: const Color(0xFF0D2D9E),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${price.toStringAsFixed(2)} \$',
            style: AppTextStyles.semiBold20.copyWith(
              color: const Color(0xFF0D2D9E),
            ),
          ),
        ],
      ),
    );
  }
}
