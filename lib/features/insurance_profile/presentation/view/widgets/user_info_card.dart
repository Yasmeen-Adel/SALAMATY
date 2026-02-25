import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF0D2D9E).withOpacity(0.25),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.account_circle_outlined,
                color: AppColors.primaryColor, size: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mohamed Ali',
                    style: AppTextStyles.medium20.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Card holder ID: M123456789',
                    style: AppTextStyles.regular14.copyWith(
                      color: const Color(0xFF989898),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
