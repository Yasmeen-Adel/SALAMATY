import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/custom_text_field.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/text_button_row.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_header_image.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_title.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_subtitle.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/cubit/sign_up_cubit.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/cubit/sign_up_state.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Map<String, String?> fieldErrors = {};

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() {
    setState(() {
      fieldErrors = {};
    });

    context.read<SignUpCubit>().signUp(
          fullName: fullNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        // Errors from backend
        if (state is SignUpError) {
          setState(() {
            fieldErrors = state.fieldErrors;
          });
        }

        // Success → Go to Verification
        if (state is SignUpSuccess) {
          Navigator.pushNamed(
            context,
            VerificationScreen.routeName,
            // arguments: state.email, 
            arguments: {
              'email': state.email, 
            },
          );
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SignInHeaderImage(),
              const SignInTitle(titleText: 'Sign Up'),
              const SignInSubtitle(
                subtitleText: 'Please sign up to continue',
              ),
              CustomTextField(
                controller: fullNameController,
                hintText: 'Name',
                prefixIcon: Icons.person,
                errorText: fieldErrors['fullname'],
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
                errorText: fieldErrors['email'],
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
                errorText: fieldErrors['password'],
              ),
              CustomTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock,
                isPassword: true,
                errorText: fieldErrors['confirmpassword'],
              ),
              const SizedBox(height: 18),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return LargeAppButton(
                    text: 'Sign Up',
                    onPressed: signUp,
                  );
                },
              ),
              const SizedBox(height: 10),
              TextButtonRow(
                questionText: 'Already have an account? ',
                textButton: 'Sign In',
                onpressed: () {
                  Navigator.pushNamed(
                    context,
                    SignInScreen.routeName,
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
