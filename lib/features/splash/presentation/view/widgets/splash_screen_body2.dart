import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salamaty/core/services/localization_provider.dart';
import 'package:salamaty/core/widgets/small_app_button.dart';
import 'package:salamaty/features/onboarding/presentation/view/widgets/onboarding_main_screen.dart';
import 'package:salamaty/features/splash/presentation/view/widgets/splash2_image.dart';
import 'package:salamaty/features/splash/presentation/view/widgets/splash2_text.dart';
import 'package:salamaty/generated/l10n.dart';

class SplashScreenBody2 extends StatelessWidget {
  const SplashScreenBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(),
        Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Splash2Image(),
                const SizedBox(height: 30),
                const Splash2Text(),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmallAppButton(
                      text: S.of(context).next,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const OnboardingMainScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.09,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.language, color: Color(0xFF0D2D9E)),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                // backgroundColor: Colors.white,
                builder: (_) {
                  final localeProvider =
                      Provider.of<LocalizationProvider>(context, listen: false);
                  String currentLang = localeProvider.locale.languageCode;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.language,
                            color: Color(0xFF0D2D9E)),
                        title: Text(S.of(context).english),
                        selected: currentLang == 'en',
                        onTap: () {
                          localeProvider.changeLanguage('en');
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.language,
                            color: Color(0xFF0D2D9E)),
                        title: Text(S.of(context).arabic),
                        selected: currentLang == 'ar',
                        onTap: () {
                          localeProvider.changeLanguage('ar');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
    //   return Center(
    //     child: Padding(
    //       padding: const EdgeInsets.only(right: 20),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           const Splash2Image(),
    //           const SizedBox(height: 30),
    //           const Splash2Text(),
    //           const SizedBox(height: 40),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               SmallAppButton(
    //                 text: 'Next',
    //                 onPressed: () {
    //                   // Navigate to the next screen or perform an action
    //                    Navigator.pushReplacement(
    //                     context,
    //                     MaterialPageRoute(builder: (_) => const OnboardingMainScreen()),
    //                   );
    //                 },
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //  );
  }
}
