// import 'package:flutter/material.dart';
// import 'package:salamaty/core/utils/app_colors.dart';
// import 'package:salamaty/core/utils/app_text_styles.dart';

// class OutlinedLargeButton extends StatelessWidget {
//   const OutlinedLargeButton({
//     super.key,
//     required this.text,
//     this.onPressed,
//   });

//   final String text;
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: SizedBox(
//         width: double.infinity,
//         height: 50,
//         child: OutlinedButton(
//           onPressed: onPressed,
//           style: OutlinedButton.styleFrom(
//             side: const BorderSide(
//               color: AppColors.primaryColor,
//               width: 1.5,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//           child: Text(
//             text,
//             style: AppTextStyles.medium16.copyWith(
//               color: AppColors.primaryColor,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';

class OutlinedLargeButton extends StatelessWidget {
  const OutlinedLargeButton({
    super.key,
    required this.text,
    this.onPressed,
    this.height = 60,
  });

  final String text;
  final VoidCallback? onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.bold24.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
