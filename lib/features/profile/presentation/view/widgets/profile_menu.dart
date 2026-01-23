import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/language_selector.dart';
import 'package:salamaty/core/widgets/custom_text_field.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'UserName',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0033A0),
          ),
        ),
        // const SizedBox(height: 4),
        const Text(
          'user@gmail.com',
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: 'Address',
          prefixIcon: Icons.location_on,
        ),
        CustomTextField(
          hintText: 'Insurance Profile',
          prefixIcon: Icons.shield_outlined,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        CustomTextField(
          hintText: 'Email',
          prefixIcon: Icons.email_outlined,
        ),
        CustomTextField(
          hintText: 'Gender',
          prefixIcon: Icons.female,
        ),
        CustomTextField(
          hintText: 'Edit Profile',
          prefixIcon: Icons.edit_outlined,
        ),

        LanguageSelectorTile(),
      ],
    );
  }
}
