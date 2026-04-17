// import 'package:flutter/material.dart';
// import 'package:salamaty/generated/l10n.dart';

// class Splash2Text extends StatelessWidget {
//   const Splash2Text({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Rich Text: Welcome to Salamaty
//         RichText(
//           text: TextSpan(
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//               height: 1.4,
//             ),
//             children: [
//               TextSpan(
//                 text: S.of(context).welcome,
//                 style: TextStyle(letterSpacing: 1.5, color: Colors.black),
//               ),
//               TextSpan(
//                 text: S.of(context).appName,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 28,
//                     letterSpacing: 1.5,
//                     color: Color(0xFF0D2D9E)),
//               ),
//             ],
//           ),
//         ),

//         SizedBox(height: 8),

//         // Subtitle text
//         Text(
//           S.of(context).onboardingSubtitle,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//             height: 1.4,
//             letterSpacing: 1.5,
//           ),
//           textAlign: TextAlign.left,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:salamaty/generated/l10n.dart';

class Splash2Text extends StatelessWidget {
  const Splash2Text({super.key});

  @override
  Widget build(BuildContext context) {
    final isLTR = Directionality.of(context) == TextDirection.ltr;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rich Text: Welcome to Salamaty
        RichText(
          textDirection: Directionality.of(context),
          textAlign: TextAlign.start,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
            children: [
              TextSpan(
                text: S.of(context).welcome,
                style: TextStyle(
                  letterSpacing: isLTR ? 1.5 : 0,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: S.of(context).appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: isLTR ? 1.5 : 0,
                  color: const Color(0xFF0D2D9E),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle text
        Text(
          S.of(context).onboardingSubtitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.4,
            letterSpacing: isLTR ? 1.5 : 0,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
