import 'package:flutter/material.dart';
import 'package:otp_plus/otp_inputs.dart';
import 'package:otp_plus/utils/enum/otp_field_shape.dart';
import 'package:salamaty/core/utils/app_colors.dart';
class OtpWidget extends StatelessWidget {
  final Function(String otp) onOtpCompleted;

  const OtpWidget({
    super.key,
    required this.onOtpCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return OtpPlusInputs(
      size: 55,
      length: 5,
      focusedBorderColor: AppColors.primaryColor,
      horizontalSpacing: 11,
      shape: OtpFieldShape.square,
      textDirection: TextDirection.ltr,
      onComplete: onOtpCompleted,
    );
  }
}
