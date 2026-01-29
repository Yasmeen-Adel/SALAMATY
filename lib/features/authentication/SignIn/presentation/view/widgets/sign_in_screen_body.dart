import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/custom_text_field.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/core/widgets/text_button_row.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_cubit.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_state.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/forgot_password_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/outlined_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_header_image.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_subtitle.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_title.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/view/sign_up_screen.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/forgot_password_screen.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Map<String, String?> fieldErrors = {};

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainScreen.routeName,
            (route) => false,
          );
        }

        if (state is SignInFailure) {
          setState(() {
            fieldErrors = state.fieldErrors;
          });

          if (state.message.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const SignInHeaderImage(),
              const SignInTitle(titleText: 'Sign In'),
              const SignInSubtitle(subtitleText: 'Please sign in to continue'),
              const SizedBox(height: 10),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
                errorText: fieldErrors['email'],
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
                errorText: fieldErrors['password'],
              ),
              ForgotPasswordButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ForgotPasswordScreen.routeName,
                  );
                },
              ),
              const SizedBox(height: 10),
              state is SignInLoading
                  ? const CircularProgressIndicator()
                  : LargeAppButton(
                      text: 'Sign In',
                      onPressed: () {
                        context.read<SignInCubit>().login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      },
                    ),
              const SizedBox(height: 32),
              TextButtonRow(
                questionText: 'Don\'t have an account? ',
                textButton: 'Sign Up',
                onpressed: () {
                  Navigator.pushNamed(
                    context,
                    SignUpScreen.routeName,
                  );
                },
              ),
              const SizedBox(height: 16),
              const CustomOutlinedButton(),
            ],
          ),
        );
      },
    );
  }
}
