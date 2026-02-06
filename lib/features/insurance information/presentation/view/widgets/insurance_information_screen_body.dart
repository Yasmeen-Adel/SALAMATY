import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/insurance%20information/presentation/view/widgets/image_upload_card.dart';
import 'package:salamaty/features/insurance%20information/presentation/view/widgets/text_input.dart';
import 'package:salamaty/features/insurance%20services/presentation/view/insurance_services_screen.dart';

class InsuranceInformationScreenBody extends StatelessWidget {
  const InsuranceInformationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          ArrowBack(),
          CustomScreenTitle(title: 'Insurance Information'),
          SizedBox(
            height: 24,
          ),
          CustomTextFieldLabel(labelText: 'Write Your Insurance ID Number'),
          TextInput(
            hintText: 'Insurance ID Number',
            isPassword: true,
          ),
          SizedBox(
            height: 24,
          ),
          CustomTextFieldLabel(labelText: 'Upload Your Insurance photos'),
          const ImageUploadCard(
            title: 'National ID Front',
            description: 'Upload the front side of your National ID',
          ),
          const ImageUploadCard(
            title: 'National ID Back',
            description: 'Upload the back side of your National ID',
          ),
          SizedBox(
            height: 32,
          ),
          LargeAppButton(
              text: 'Submit',
              onPressed: () {
                Navigator.pushNamed(context, InsuranceServicesScreen.routeName);
              }),
        ],
      ),
    );
  }
}
