import 'package:flutter/material.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_action_buttons.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_image.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_menu.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0033A0),
      child: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const ProfileImage(),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          ProfileMenu(),
                          SizedBox(height: 20),
                          ProfileActionButtons(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
