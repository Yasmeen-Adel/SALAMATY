import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_image.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/authentication/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:salamaty/generated/l10n.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  final String email;
  final String otpCode;

  const ResetPasswordScreenBody({
    super.key,
    required this.email,
    required this.otpCode,
  });

  @override
  State<ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<ResetPasswordScreenBody> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) async {
        if (state is ResetPasswordSuccess) {
          await AuthLocalStorage.clear();
          DioHelper.clearToken();

          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.success,
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            SignInScreen.routeName,
            (route) => false,
          );
        }

        if (state is ResetPasswordFailure) {
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
                const SizedBox(height: 10),
                CustomScreenTitle(title: S.of(context).resetPasswordTitle),
                const SizedBox(height: 8),
                CustomScreenSubtitle(
                  subtitleText: S.of(context).resetPasswordSubtitle,
                ),
                const CustomImage(
                  imageUrl: 'assets/images/set_password.png',
                ),
                CustomTextFieldLabel(labelText: S.of(context).newPassword),
                CustomTextField(
                  controller: newPasswordController,
                  hintText: S.of(context).newPassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 8),
                CustomTextFieldLabel(labelText: S.of(context).confirmPassword),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: S.of(context).confirmPassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 26),
                state is ResetPasswordLoading
                    ? const CircularProgressIndicator()
                    : LargeAppButton(
                        text: S.of(context).updatePassword,
                        onPressed: () {
                          context.read<ResetPasswordCubit>().resetPassword(
                                email: widget.email,
                                otpCode: widget.otpCode,
                                newPassword: newPasswordController.text.trim(),
                                confirmPassword:
                                    confirmPasswordController.text.trim(),
                              );
                        },
                      ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
