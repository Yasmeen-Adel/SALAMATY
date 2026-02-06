import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_header.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_list.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/filter_tabs.dart';

class FacilitiesScreenBody extends StatefulWidget {
  const FacilitiesScreenBody({super.key});

  @override
  State<FacilitiesScreenBody> createState() => _FacilitiesScreenBodyState();
}

int selectedIndex = 0;

class _FacilitiesScreenBodyState extends State<FacilitiesScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FacilitiesHeader(),
        SizedBox(height: 12),
        CustomTextFieldLabel(
          labelText: 'Filter by',
        ),
        SizedBox(height: 6),
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

//Back end ...........)
// List<String> filters = apiResponse.map((e) => e.name).toList();

// FilterTabs(
//   filters: filters,
//   selectedIndex: selectedIndex,
//   onChanged: (index) {
//     setState(() {
//       selectedIndex = index;
//       selectedFilterId = apiResponse[index].id;
//     });
//   },
// );
