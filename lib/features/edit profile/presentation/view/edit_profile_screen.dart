import 'package:flutter/material.dart';
import 'package:salamaty/features/edit%20profile/presentation/view/widgets/edit_profile_screen_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  static const String routeName = 'edit_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditProfileScreenBody());
  }
}
