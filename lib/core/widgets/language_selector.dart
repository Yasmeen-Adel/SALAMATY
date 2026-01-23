// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:salamaty/core/services/localization_provider.dart';
// import 'package:salamaty/core/utils/app_colors.dart';
// import 'package:salamaty/core/utils/app_text_styles.dart';
// import 'package:salamaty/generated/l10n.dart';

// class LanguageSelectorTile extends StatelessWidget {
//   const LanguageSelectorTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final localeProvider = context.watch<LocalizationProvider>();
//     String currentLang = localeProvider.locale.languageCode;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
//       child: ListTile(
//         leading: Icon(Icons.language, color: AppColors.primaryColor, size: 24),
//         title: Text(
//           S.of(context).language,
//           style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
//         ),
//         trailing: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor, size: 16),
//         onTap: () {
//           showModalBottomSheet(
//             context: context,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             ),
//             backgroundColor: Colors.white,
//             builder: (_) => Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   leading: const Icon(Icons.language),
//                   title: Text(
//                     S.of(context).english,
//                     style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
//                   ),
//                   selected: currentLang == 'en',
//                   onTap: () {
//                     localeProvider.changeLanguage('en');
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.language),
//                   title: Text(
//                     S.of(context).arabic,
//                     style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
//                   ),
//                   selected: currentLang == 'ar',
//                   onTap: () {
//                     localeProvider.changeLanguage('ar');
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salamaty/core/services/localization_provider.dart';
import 'package:salamaty/generated/l10n.dart';

class LanguageSelectorTile extends StatelessWidget {
  const LanguageSelectorTile({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocalizationProvider>();
    String currentLang = localeProvider.locale.languageCode;
    const Color primaryColor = Color(0xFF0D2D9E);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            backgroundColor: Colors.white,
            builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.language, color: primaryColor),
                  title: Text(
                    S.of(context).english,
                    style:  TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                  selected: currentLang == 'en',
                  onTap: () {
                    localeProvider.changeLanguage('en');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.language, color: primaryColor),
                  title: Text(
                    S.of(context).arabic,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                  selected: currentLang == 'ar',
                  onTap: () {
                    localeProvider.changeLanguage('ar');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0x33697DC3),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.language, color: primaryColor, size: 24),
                  const SizedBox(width: 14),
                  Text(
                    S.of(context).language,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 99, 98, 98),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded, color: primaryColor, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
