import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class BenefitItem extends StatelessWidget {
  final Widget iconPath;
  final String title;
  final List<String> items;
  final bool isCovered;

  const BenefitItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.items,
    required this.isCovered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF0D2D9E).withOpacity(0.25),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E40AF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Padding(padding: const EdgeInsets.all(8.0), child: iconPath
                        // Image.asset(
                        //   iconPath,
                        //   fit: BoxFit.contain,
                        // ),
                        ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.medium20.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              if (isCovered)
                Row(
                  children: [
                    Text(
                      'covered',
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFF989898),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.check_circle_outline,
                      color: Color.fromARGB(255, 57, 195, 55),
                      size: 20,
                    ),
                    // Image.asset(
                    //   'assets/icons/covered_icon.png',
                    //   width: 16,
                    //   height: 16,
                    //   fit: BoxFit.contain,
                    // ),
                  ],
                ),
            ],
          ),
          if (items.isNotEmpty) ...[
            const SizedBox(height: 8),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 2, left: 52),
                child: Text(
                  item,
                  style: AppTextStyles.regular14.copyWith(
                    color: const Color(0xFF989898),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
