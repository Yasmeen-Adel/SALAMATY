import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class MedicineDescriptionSection extends StatefulWidget {
  final String description;

  const MedicineDescriptionSection({
    super.key,
    required this.description,
  });

  @override
  State<MedicineDescriptionSection> createState() =>
      _MedicineDescriptionSectionState();
}

class _MedicineDescriptionSectionState
    extends State<MedicineDescriptionSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.description,
            maxLines: isExpanded ? null : 3,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: AppTextStyles.regular14.copyWith(
              color: const Color(0xFF000000),
            ),
          ),
          if (widget.description.length > 100)
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? 'Show less' : 'Read more',
                style: const TextStyle(
                  color: Color(0xFF0D2D9E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
