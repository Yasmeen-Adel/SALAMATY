import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/custom_text_field.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/arrow_back.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/forgot_password_image.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/forgot_password_subtitle.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/forgot_password_title.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/text_field_label.dart';
import 'package:salamaty/features/authentication/reset%20password/presentation/view/reset_password_screen.dart';

class ForgotPasswordScreenBody extends StatelessWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            ArrowBack(),
            SizedBox(height: 16),
            ForgotPasswordTitle(title: 'Forgot password ?'),
            SizedBox(height: 8),
            ForgotPasswordSubtitle(
                subtitleText:
                    'Please enter your email to receive a link to create a new password via email'),
            SizedBox(height: 24),
            ForgotPasswordImage(
              imageUrl: 'assets/images/forget_password.png',
            ),
            SizedBox(height: 32),
            TextFieldLabel(
              labelText: 'Your Email : ',
            ),
            CustomTextField(
              hintText: 'Enter your email',
              prefixIcon: Icons.email,
            ),
            SizedBox(height: 26),
            LargeAppButton(
              text: 'Reset Password',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ResetPasswordScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
