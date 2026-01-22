import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/custom_text_field.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/forgot_password_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/outlined_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_header_image.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_subtitle.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_title.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_up_row.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/view/sign_up_screen.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/forgot_password_screen.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),

          SignInHeaderImage(),
          SignInTitle(titleText: 'Sign In'),
          // SizedBox(height: 8),
          SignInSubtitle(subtitleText: 'Please sign in to continue'),
          SizedBox(height: 10),
          CustomTextField(hintText: 'Email', prefixIcon: Icons.email),
          SizedBox(height: 8),
          CustomTextField(
              hintText: 'Password', prefixIcon: Icons.lock, isPassword: true),

          // SizedBox(height: 12),
          ForgotPasswordButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                ForgotPasswordScreen.routeName,
              );
            },
          ),
          SizedBox(height: 10),
          LargeAppButton(
            text: 'Sign In',
            onPressed: () {},
          ),
          SizedBox(height: 32),
          SignUpRow(
            questionText: 'Don\'t have an account? ',
            textButton: 'Sign Up',
            onSignUpPressed: () {
              Navigator.pushNamed(
                context,
                SignUpScreen.routeName,
              );
            },
          ),
          SizedBox(height: 16),
          CustomOutlinedButton(),
        ],
      ),
    );
  }
}
