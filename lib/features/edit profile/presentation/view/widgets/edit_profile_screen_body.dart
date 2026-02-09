import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/edit%20profile/presentation/view/widgets/birthday_field.dart';
import 'package:salamaty/features/edit%20profile/presentation/view/widgets/edit_profile_text_field.dart';
import 'package:salamaty/features/edit%20profile/presentation/view/widgets/gender_field.dart';

class EditProfileScreenBody extends StatelessWidget {
  const EditProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 60,
        ),
        ArrowBack(),
        CustomScreenTitle(title: 'Edit Profile'),
        CustomScreenSubtitle(
          subtitleText:
              'Manage and update your personal information easily from here.',
        ),
        SizedBox(height: 30),
        EditProfileTextField(label: 'Full name'),
        SizedBox(height: 5),
        EditProfileTextField(label: 'Address'),
        SizedBox(height: 5),
        GenderField(),
        SizedBox(height: 5),
        BirthdayField(),
        SizedBox(height: 40),
        LargeAppButton(text: 'Save', onPressed: () {})
      ],
    ));
  }
}
