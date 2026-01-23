import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/custom_text_field.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_image.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/core/widgets/custom_drawer.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';

class ResetPasswordScreenBody extends StatelessWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            ArrowBack(),
            SizedBox(height: 10),
            CustomScreenTitle(title: 'Reset password'),
            SizedBox(height: 8),
            CustomScreenSubtitle(
                subtitleText:
                    'Please enter your email to receive a link to create a new password via email'),
            CustomImage(
              imageUrl: 'assets/images/set_password.png',
            ),
            CustomTextFieldLabel(
              labelText: 'New password : ',
            ),
            CustomTextField(
              hintText: ' password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: 5),
            CustomTextFieldLabel(
              labelText: ' Confirm password : ',
            ),
            CustomTextField(
              hintText: 'Confirm new password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: 26),
            LargeAppButton(
              text: 'Update Password',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => CustomDrawer(
                    title: 'Password Changed',
                    description:
                        'Your password has been changed successfully. You can login again with your new password.',
                    buttonText: 'Return to Sign In',
                    nextScreen: SignInScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
