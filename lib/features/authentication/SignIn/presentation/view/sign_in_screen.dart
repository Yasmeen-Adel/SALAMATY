import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_cubit.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_screen_body.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String routeName = 'sign_in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(AuthRepo()),
      child: const Scaffold(
        body: SignInScreenBody(),
      ),
    );
  }
}
