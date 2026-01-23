import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/core/widgets/custom_text_field.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_header_image.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_title.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_subtitle.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/text_button_row.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SignInHeaderImage(),
              const SignInTitle(titleText: 'Sign Up'),
              const SignInSubtitle(
                subtitleText: 'Please sign up to continue',
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: 'Name',
                prefixIcon: Icons.person,
                isPassword: false,
              ),
              const SizedBox(height: 6),
              const CustomTextField(
                hintText: 'Email',
                prefixIcon: Icons.email,
                isPassword: false,
              ),
              const SizedBox(height: 6),
              const CustomTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 6),
              const CustomTextField(
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              LargeAppButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    VerificationScreen.routeName,
                  );  
                },
              ),
              const SizedBox(height: 10),
              TextButtonRow(
                questionText: 'Already have an account? ',
                textButton: 'Sign In',
                onSignUpPressed: () {
                  Navigator.pushNamed(
                    context,
                    SignInScreen.routeName,
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
