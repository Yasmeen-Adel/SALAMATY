import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_list.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/filter_tabs.dart';

class InsuranceServicesScreenBody extends StatefulWidget {
  const InsuranceServicesScreenBody({super.key});

  @override
  State<InsuranceServicesScreenBody> createState() =>
      _InsuranceServicesScreenBodyState();
}

int selectedIndex = 0;

class _InsuranceServicesScreenBodyState
    extends State<InsuranceServicesScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        ArrowBack(),
        CustomScreenTitle(title: 'Insurance Services'),
        CustomScreenSubtitle(
          subtitleText: 'A list of medicines marked as favorites by the user.',
        ),
        SizedBox(height: 12),
        SizedBox(height: 10),
        CustomTextFieldLabel(labelText: 'Nearby Services'),
        SizedBox(height: 10),
        FilterTabs(
          filters: ['All', 'Labs', 'Hospitals', 'Pharmacies'],
          selectedIndex: selectedIndex,
          onChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        Expanded(child: FacilitiesList()),
      ],
    );
  }
}
