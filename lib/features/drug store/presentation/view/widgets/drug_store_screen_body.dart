import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/drug%20store/presentation/view/widgets/drug_store_header.dart';
import 'package:salamaty/features/drug%20store/presentation/view/widgets/medicine_list.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_header.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/filter_tabs.dart';

class DrugStoreScreenBody extends StatefulWidget {
  const DrugStoreScreenBody({super.key});

  @override
  State<DrugStoreScreenBody> createState() => _DrugStoreScreenBodyState();
}

int selectedIndex = 0;
final medicineCategories = [
  'All',
  'Painkillers',
  'Antibiotics',
  'Allergy',
  'Cold & Flu',
  'Stomach',
  'Blood Pressure',
  'Diabetes',
  'Vitamins',
  'Skin Care',
];

class _DrugStoreScreenBodyState extends State<DrugStoreScreenBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrugStoreHeader(),
        const SizedBox(height: 12),
        const CustomTextFieldLabel(
          labelText: 'Filter by',
        ),
        const SizedBox(height: 6),
        FilterTabs(
          filters: medicineCategories,
          selectedIndex: selectedIndex,
          onChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        const SizedBox(height: 12),
        const Expanded(
          child: MedicineList(),
        ),
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
