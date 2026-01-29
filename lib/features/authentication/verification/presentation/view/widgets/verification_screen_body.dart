import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/custom_drawer.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_image.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/core/widgets/text_button_row.dart';
import 'package:salamaty/features/authentication/verification/presentation/cubit/verification_cubit.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/widgets/otp_widget.dart';

class VerificationScreenBody extends StatefulWidget {
  final String email;

  const VerificationScreenBody({
    super.key,
    required this.email,
  });

  @override
  State<VerificationScreenBody> createState() => _VerificationScreenBodyState();
}

class _VerificationScreenBodyState extends State<VerificationScreenBody> {
  final TextEditingController otpController = TextEditingController();

  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is VerificationSuccess) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => CustomDrawer(
              title: 'Account Verified',
              description: 'Your account has been verified successfully.',
              buttonText: 'Continue',
              nextScreen: MainScreen(),
            ),
          );
        }

        if (state is VerificationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        }
        if (state is ResendOtpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        }

        if (state is ResendOtpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
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

                // OTP Widget
                OtpWidget(
                  controller: otpController,
                  onOtpCompleted: (value) {
                    otpCode = value;
                    FocusScope.of(context).unfocus();
                  },
                ),

                const SizedBox(height: 10),

                // TextButtonRow(
                //   questionText: 'Didn\'t receive OTP code? ',
                //   textButton: 'Send Again',
                //   onpressed: () {
                //     context.read<VerificationCubit>().resendOtp(
                //           email: widget.email,
                //         );
                //   },
                // ),
                TextButtonRow(
                  questionText: 'Didn\'t receive OTP code? ',
                  textButton:
                      state is ResendOtpLoading ? 'Sending...' : 'Send Again',
                  onpressed: state is ResendOtpLoading
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();

                          otpController.clear();
                          otpCode = '';

                          context.read<VerificationCubit>().resendOtp(
                                email: widget.email,
                              );
                        },
                ),

                const SizedBox(height: 40),

                state is VerificationLoading
                    ? const CircularProgressIndicator()
                    : LargeAppButton(
                        text: 'Verify',
                        onPressed: () {
                          if (otpCode.isEmpty || otpCode.length < 5) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Please enter valid OTP'),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
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
