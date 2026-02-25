import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/cubit/sign_up_cubit.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/cubit/sign_up_state.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/view/widgets/sign_up_screen_body.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(AuthRepo()),
      child: Scaffold(
        body: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              Navigator.pushNamed(
                context,
                VerificationScreen.routeName,
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                const SignUpScreenBody(),
                if (state is SignUpLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
