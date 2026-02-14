import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/core/widgets/custom_drawer.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_image.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/core/widgets/text_button_row.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/authentication/reset%20password/presentation/view/reset_password_screen.dart';
import 'package:salamaty/features/authentication/verification/presentation/cubit/verification_cubit.dart';
import 'package:salamaty/features/authentication/verification/presentation/cubit/verification_state.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/widgets/otp_widget.dart';

class VerificationScreenBody extends StatefulWidget {
  final String email;
  final bool fromForgotPassword;

  const VerificationScreenBody({
    super.key,
    required this.email,
    required this.fromForgotPassword,
  });

  @override
  State<VerificationScreenBody> createState() => _VerificationScreenBodyState();
}

class _VerificationScreenBodyState extends State<VerificationScreenBody> {
  String otpCode = '';
  Key otpKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        // VERIFY SUCCESS
        if (state is VerificationSuccess) {
          if (widget.fromForgotPassword) {
            //  Forgot Password flow → Reset Password
            Navigator.pushReplacementNamed(
              context,
              ResetPasswordScreen.routeName,
              arguments: {
                'email': widget.email,
                'otpCode': otpCode,
              },
            );
          } else {
            //  Sign up / Login → Main Screen
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => CustomDrawer(
                title: 'Account Verified',
                description: 'Your account has been verified successfully.',
                buttonText: 'Continue',
                nextScreen:  MainScreen(),
              ),
            );
          }
        }

        // VERIFY FAILED
        if (state is VerificationFailure) {
          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.error,
          );
        }

        // RESEND OTP SUCCESS
        if (state is ResendOtpSuccess) {
          setState(() {
            otpCode = '';
            otpKey = UniqueKey();
          });
          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.success,
          );
        }

        // RESEND OTP FAILED
        if (state is ResendOtpFailure) {
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
                const SizedBox(height: 16),
                const ArrowBack(),
                const SizedBox(height: 16),
                const CustomScreenTitle(title: 'Verification'),
                const SizedBox(height: 8),
                const CustomScreenSubtitle(
                  subtitleText:
                      'Please enter OTP sent to your email to verify your account',
                ),
                const CustomImage(
                  imageUrl: 'assets/images/verification.png',
                ),

                /// OTP
                OtpWidget(
                  key: otpKey,
                  onOtpCompleted: (value) {
                    otpCode = value;
                  },
                ),

                const SizedBox(height: 10),

                /// Resend OTP
                TextButtonRow(
                  questionText: 'Didn\'t receive OTP code? ',
                  textButton:
                      state is ResendOtpLoading ? 'Sending...' : 'Send Again',
                  onpressed: state is ResendOtpLoading
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          context
                              .read<VerificationCubit>()
                              .resendOtp(email: widget.email);
                        },
                ),

                const SizedBox(height: 40),

                // Verify button
                state is VerificationLoading
                    ? const CircularProgressIndicator()
                    : LargeAppButton(
                        text: 'Verify',
                        onPressed: () {
                          FocusScope.of(context).unfocus();

                          if (otpCode.length < 5) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Please enter valid OTP'),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            );
                            return;
                          }

                          context.read<VerificationCubit>().verify(
                                email: widget.email,
                                otpCode: otpCode,
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
