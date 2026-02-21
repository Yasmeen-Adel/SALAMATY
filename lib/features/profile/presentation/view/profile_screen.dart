import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit() ..loadSavedImage()..loadProfile(),
      child: const Scaffold(
        body: ProfileScreenBody(),
      ),
    );
  }
}
