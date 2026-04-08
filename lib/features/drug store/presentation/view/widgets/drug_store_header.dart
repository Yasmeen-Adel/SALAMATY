import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/features/drug%20store/presentation/view/widgets/drug_store_search_bar.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_search_bar.dart';

class DrugStoreHeader extends StatelessWidget {
  const DrugStoreHeader({super.key});

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
              Text(
                'Drug Store',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
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
          const DrugStoreSearchBar(),
        ],
      ),
    );
  }
}
