import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/facilities/presentation/cubit/facilities_cubit.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_header.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_list.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/filter_tabs.dart';
import 'package:salamaty/generated/l10n.dart';

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
        FacilitiesHeader(
          headerText: S.of(context).facilitiesScreenHeader,
        ),
        SizedBox(height: 12),
        CustomTextFieldLabel(
          labelText: S.of(context).filterBy,
        ),
        SizedBox(height: 6),
        FilterTabs(
          filters: [
            S.of(context).all,
            S.of(context).labs,
            S.of(context).hospitals,
            S.of(context).pharmacies
          ],
          selectedIndex: selectedIndex,
          onChanged: (index) {
            setState(() {
              selectedIndex = index;
            });

            String? type;

            if (index == 1) type = "Lab";
            if (index == 2) type = "Hospital";
            if (index == 3) type = "Pharmacy";

            context.read<FacilitiesCubit>().loadAllFacilities(type: type);
          },
          
        ),
        Expanded(child: FacilitiesList()),
      ],
    );
  }
}
