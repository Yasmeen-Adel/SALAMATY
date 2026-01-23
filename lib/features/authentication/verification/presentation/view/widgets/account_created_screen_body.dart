import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/widgets/lottie_animation.dart';

class AccountCreatedScreenBody extends StatelessWidget {
  const AccountCreatedScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            ArrowBack(),
            SizedBox(height: 16),
            CustomScreenTitle(title: 'Account Created 🥳'),
            SizedBox(height: 8),
            CustomScreenSubtitle(subtitleText: 'Welcome to SALAMATY!'),
            SizedBox(height: 24),
           LottieAnimation(
              animationUrl: 'assets/animations/insurance file.json',
            ),
            SizedBox(height: 60),
            LargeAppButton(
              text: 'Countinue',
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainScreen.routeName,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
