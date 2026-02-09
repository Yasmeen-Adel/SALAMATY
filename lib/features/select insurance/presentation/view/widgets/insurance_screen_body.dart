import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/home/presentation/view/widgets/header_section.dart';
import 'package:salamaty/features/insurance%20information/presentation/view/insurance_information_screen.dart';
import 'package:salamaty/features/select%20insurance/presentation/view/widgets/insurance_card.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';

class InsuranceScreenBody extends StatefulWidget {
  const InsuranceScreenBody({super.key});

  @override
  State<InsuranceScreenBody> createState() => _InsuranceScreenBodyState();
}

class _InsuranceScreenBodyState extends State<InsuranceScreenBody> {
  String selectedInsurance = '';

  final List<Map<String, String>> insuranceList = [
    {'name': 'Misr Insurance', 'imageUrl': 'assets/images/onboarding2.png'},
    {'name': 'Al Ahly Insurance', 'imageUrl': 'assets/images/onboarding2.png'},
    {'name': 'Bupa Arabia', 'imageUrl': 'assets/images/onboarding2.png'},
    {'name': 'Al Hayat Insurance', 'imageUrl': 'assets/images/onboarding2.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSection(),
        const SizedBox(height: 30),
        const CustomTextFieldLabel(labelText: 'Select Your Insurance'),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: insuranceList.length,
            itemBuilder: (context, index) {
              final insurance = insuranceList[index];
              return InsuranceCard(
                name: insurance['name']!,
                imageUrl: insurance['imageUrl']!,
                selected: selectedInsurance == insurance['name'],
                onTap: () {
                  setState(() {
                    selectedInsurance = insurance['name']!;
                  });
                },
              );
            },
          ),
        ),
        LargeAppButton(
          text: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, InsuranceInformationScreen.routeName);

            print('Selected Insurance: $selectedInsurance');
          },
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
