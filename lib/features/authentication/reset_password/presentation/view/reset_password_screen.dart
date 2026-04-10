import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'package:salamaty/features/authentication/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'widgets/reset_password_screen_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otpCode,
  });

  static const String routeName = 'reset_password_screen';

  final String email;
  final String otpCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(AuthRepo()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ResetPasswordScreenBody(
          email: email,
          otpCode: otpCode,
        ),
      ),
    );
  }
}
