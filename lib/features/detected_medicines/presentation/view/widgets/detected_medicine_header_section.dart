import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class DetectedMedicineHeaderSection extends StatelessWidget {
  const DetectedMedicineHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 20, top: 50, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArrowBack(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text(
              'Medicine Alternatives',
              style: AppTextStyles.semiBold24.copyWith(
                color: const Color(0xFF0D2D9E),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text(
              'Find alternative medicines that provide similar effects to the selected medicine.',
              style: AppTextStyles.medium16.copyWith(
                color: const Color(0xFF989898),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
