import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/custom_drawer.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_image.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/core/widgets/text_button_row.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/widgets/otp_widget.dart';

class VerificationScreenBody extends StatelessWidget {
  const VerificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            ArrowBack(),
            SizedBox(height: 16),
            CustomScreenTitle(title: 'Verification'),
            SizedBox(height: 8),
            CustomScreenSubtitle(
                subtitleText:
                    'Please enter OTP sent to your email to verify your account'),
            CustomImage(
              imageUrl: 'assets/images/verification.png',
            ),
            OtpWidget(),
            SizedBox(height: 10),
            TextButtonRow(
              questionText: 'Didn\'t receive OTP code? ',
              textButton: 'Send Again',
              onSignUpPressed: () {},
            ),
            SizedBox(height: 40),
            LargeAppButton(
              text: 'Verify',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => CustomDrawer(
                    title: 'Account Verified',
                    description:
                        ' Your account has been verified successfully. You can now proceed to use the app.',
                    buttonText: 'continue',
                    nextScreen: MainScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
