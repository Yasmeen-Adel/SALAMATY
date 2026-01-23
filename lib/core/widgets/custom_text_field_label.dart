import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';

class CustomTextFieldLabel extends StatelessWidget {
  const CustomTextFieldLabel({
    super.key, required this.labelText,
  });

final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          labelText,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
