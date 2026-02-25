import 'package:flutter/material.dart';
import 'package:salamaty/features/edit%20profile/presentation/view/widgets/edit_profile_screen_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  static const String routeName = 'edit_profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditProfileCubit(),
      child: Scaffold(
        body: EditProfileScreenBody(),
      ),
    );
  }
}