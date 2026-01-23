import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 65,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              size: 50,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 100,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
