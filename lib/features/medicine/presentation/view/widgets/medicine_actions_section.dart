import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/core/widgets/large_app_Button.dart';
import 'package:salamaty/core/widgets/outlined_large_button.dart';

class MedicineActionsSection extends StatefulWidget {
  const MedicineActionsSection({super.key});

  @override
  State<MedicineActionsSection> createState() => _MedicineActionsSectionState();
}

class _MedicineActionsSectionState extends State<MedicineActionsSection> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              // Favorite Icon Button
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isFavorite ? Colors.red : const Color(0xFF0D2D9E),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              // See Alternatives Button
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D2D9E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'See Alternatives',
                      style: AppTextStyles.semiBold24.copyWith(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Find Pharmacies Outlined Button
          OutlinedLargeButton(
            text: 'Find Pharmacies',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
