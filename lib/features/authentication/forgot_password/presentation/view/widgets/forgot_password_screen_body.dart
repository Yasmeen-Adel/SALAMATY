import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/custom_text_field.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_image.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/authentication/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:salamaty/features/authentication/forgot_password/presentation/cubit/forgot_password_state.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';

class ForgotPasswordScreenBody extends StatefulWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  State<ForgotPasswordScreenBody> createState() =>
      _ForgotPasswordScreenBodyState();
}

class _ForgotPasswordScreenBodyState extends State<ForgotPasswordScreenBody> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.success,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VerificationScreen(
                email: state.email,
                fromForgotPassword: true,
              ),
            ),
          );
        }
        if (state is ForgotPasswordFailure) {
          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                const ArrowBack(),
                const SizedBox(height: 16),
                const CustomScreenTitle(title: 'Forgot password ?'),
                const SizedBox(height: 8),
                const CustomScreenSubtitle(
                  subtitleText:
                      'Please enter your email to receive a link to create a new password via email',
                ),
                const SizedBox(height: 24),
                const CustomImage(
                  imageUrl: 'assets/images/forget_password.png',
                ),
                const SizedBox(height: 32),
                const CustomTextFieldLabel(
                  labelText: 'Your Email : ',
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 26),

                // Loading OR Button
                state is ForgotPasswordLoading
                    ? const CircularProgressIndicator()
                    : LargeAppButton(
                        text: 'Reset Password',
                        onPressed: () {
                          FocusScope.of(context).unfocus();

                          // no Validation
                          context.read<ForgotPasswordCubit>().sendOtp(
                                email: emailController.text.trim(),
                              );
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
