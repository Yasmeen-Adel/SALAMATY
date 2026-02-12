import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class FilterTabsSection extends StatefulWidget {
  const FilterTabsSection({super.key});

  @override
  State<FilterTabsSection> createState() => _FilterTabsSectionState();
}

class _FilterTabsSectionState extends State<FilterTabsSection> {
  int _selectedIndex = 0;

  final List<String> _tabs = ['All', 'Pharmacies', 'Hospitals', 'Labs'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(
          _tabs.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: _selectedIndex == index
                      ? const Color(0xFF1E40AF)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _selectedIndex == index
                        ? const Color(0xFF1E40AF)
                        : Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Text(
                  _tabs[index],
                  style: AppTextStyles.medium16.copyWith(
                    color: _selectedIndex == index
                        ? Colors.white
                        : const Color(0xFF1E40AF),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
