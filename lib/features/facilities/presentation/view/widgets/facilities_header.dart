import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'facilities_search_bar.dart';

class FacilitiesHeader extends StatelessWidget {
  const FacilitiesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          /// AppBar Row
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded,
                    size: 34, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const Spacer(),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.tune,
                  color: Color(0xFF1E40AF),
                  size: 24,
                ),
              ),
              
            ],
          ),

          const SizedBox(height: 16),

          // Search
          const FacilitiesSearchBar(),
        ],
      ),
    );
  }
}
