import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.primaryColor,
            size: 34,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
