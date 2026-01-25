import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/language_selector.dart';
import 'package:salamaty/features/edit%20profile/presentation/view/edit_profile_screen.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_list_tile.dart';

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
        // const Text(
        //   'user@gmail.com',
        //   style: TextStyle(
        //     fontSize: 22,
        //     color: Colors.grey,
        //   ),
        // ),
        const SizedBox(height: 16),
        ProfileListTile(
          title: 'Address',
          prefixIcon: Icons.location_on_outlined,
          onTap: () {
            // Navigate to Address screen
          },
        ),

        ProfileListTile(
          title: 'Insurance Profile',
          prefixIcon: Icons.health_and_safety_outlined,
          onTap: () {
            // Navigate to Insurance Profile screen
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        ProfileListTile(
          title: 'Email',
          prefixIcon: Icons.email_outlined,
          onTap: () {
            // Navigate to Email screen
          },
        ),
        ProfileListTile(
          title: 'Gender',
          prefixIcon: Icons.female,
          onTap: () {
            // Navigate to Gender screen
          },
        ),
        ProfileListTile(
          title: 'Edit Profile',
          prefixIcon: Icons.edit_outlined,
          onTap: () {
          },
        ),
        LanguageSelectorTile(),
      ],
    );
  }
}
