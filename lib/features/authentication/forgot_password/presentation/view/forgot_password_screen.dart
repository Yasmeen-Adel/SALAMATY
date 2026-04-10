import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'package:salamaty/features/authentication/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:salamaty/features/authentication/forgot_password/presentation/view/widgets/forgot_password_screen_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const String routeName = 'forgot_password_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(AuthRepo()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ForgotPasswordScreenBody(),
      ),
    );
  }
}
