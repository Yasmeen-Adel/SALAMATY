import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/features/edit_profile/presentation/view/edit_profile_screen.dart';
import 'package:salamaty/features/notifications/presentation/view/widgets/welcome_card.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          ArrowBack(),
          SizedBox(
            height: 10,
          ),
          CustomScreenTitle(title: 'Notifications'),
          SizedBox(
            height: 10,
          ),
          WelcomeCard(
              onTap: () =>
                  Navigator.pushNamed(context, EditProfileScreen.routeName))
        ],
      ),
    );
  }
}
