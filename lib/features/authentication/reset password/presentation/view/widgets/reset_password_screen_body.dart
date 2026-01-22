import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/custom_text_field.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/arrow_back.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/forgot_password_image.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/forgot_password_subtitle.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/forgot_password_title.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/text_field_label.dart';
import 'package:salamaty/features/authentication/reset%20password/presentation/view/widgets/custom_drawer.dart';

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
            SizedBox(height: 16),
            ForgotPasswordTitle(title: 'Reset password'),
            SizedBox(height: 8),
            ForgotPasswordSubtitle(
                subtitleText:
                    'Please enter your email to receive a link to create a new password via email'),
            ForgotPasswordImage(
              imageUrl: 'assets/images/set_password.png',
            ),
            TextFieldLabel(
              labelText: 'New password : ',
            ),
            CustomTextField(
              hintText: 'Enter new password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: 5),
            TextFieldLabel(
              labelText: 'Confirm new password : ',
            ),
            CustomTextField(
              hintText: 'Re-enter new password',
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
                  builder: (context) => const CustomDrawer(),
                );
              },
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
