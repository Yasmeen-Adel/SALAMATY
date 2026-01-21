import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/forgot_password_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/outlined_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/outlined_button.dart';
// widgets imports
import 'email_text_field.dart';
import 'password_text_field.dart';
import 'sign_in_header_image.dart';
import 'sign_in_subtitle.dart';
import 'sign_in_title.dart';
import 'sign_up_row.dart';

class SignInBodyScreen extends StatelessWidget {
  const SignInBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),

          SignInHeaderImage(),
          SignInTitle(),
          SizedBox(height: 8),
          SignInSubtitle(),
          SizedBox(height: 32),
          EmailTextField(),
          SizedBox(height: 16),
          PasswordTextField(),
          // SizedBox(height: 12),
          ForgotPasswordButton(),
          SizedBox(height: 10),
          LargeAppButton(text: 'Sign In'),
          SizedBox(height: 32),
          SignUpRow(),
          SizedBox(height: 24),
          CustomOutlinedButton(),
        ],
      ),
    );
  }
}
