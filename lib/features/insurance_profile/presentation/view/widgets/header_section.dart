import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/generated/l10n.dart';

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
          Text(
            S.of(context).insuranceProfile,
            style: AppTextStyles.semiBold24.copyWith(
              color: const Color(0xFF0D2D9E),
            ),
          ),
        ],
      ),
    );
  }
}
