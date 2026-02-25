import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'package:salamaty/features/authentication/verification/presentation/cubit/verification_cubit.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/widgets/verification_screen_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
    required this.email,
    this.fromForgotPassword = false,
  });

  static const String routeName = 'verification_screen';

  final String email;
  final bool fromForgotPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerificationCubit(AuthRepo()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: VerificationScreenBody(
          email: email,
          fromForgotPassword: fromForgotPassword,
        ),
      ),
    );
  }
}
