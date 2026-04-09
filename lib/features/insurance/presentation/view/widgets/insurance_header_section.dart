import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class InsuranceHeaderSection extends StatelessWidget {
  const InsuranceHeaderSection({super.key});

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
              'Insurance Services',
              style: AppTextStyles.semiBold24.copyWith(
                color: const Color(0xFF0D2D9E),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text(
              'A list of medicines marked as favorites by the user.',
              style: AppTextStyles.regular14.copyWith(
                color: const Color(0xFF989898),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
