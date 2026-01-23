import 'package:flutter/material.dart';
import 'package:otp_plus/otp_inputs.dart';
import 'package:otp_plus/utils/enum/otp_field_shape.dart';
import 'package:salamaty/core/utils/app_colors.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpPlusInputs(
      size: 55,
      length: 5,
      //48 =>6
      focusedBorderColor: AppColors.primaryColor,
      horizontalSpacing: 11,
      shape: OtpFieldShape.square,
      textDirection: TextDirection.ltr,
      onChanged: (code) {
        debugPrint('On Changed : $code');
      },
      onSubmit: (code) {
        debugPrint('On Submit : $code');
      },
      //Add optional values here
      onComplete: (code) {
        // Add OTP verification logic here
        debugPrint('OTP entered: $code');
      },
    );
  }
}
