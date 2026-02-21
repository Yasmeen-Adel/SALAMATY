import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'facilities_search_bar.dart';

class FacilitiesHeader extends StatelessWidget {
  const FacilitiesHeader({super.key, required this.headerText});
  final String headerText;
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
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 34,
                  color: Colors.white,
                ),
              ),

              Expanded(
                child: Center(
                  child: Text(
                    headerText,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 16),
          const FacilitiesSearchBar(),
        ],
      ),
    );
  }
}
