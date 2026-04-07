import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/facilities/presentation/cubit/facilities_cubit.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_screen_body.dart';

class FacilitiesScreen extends StatelessWidget {
  const FacilitiesScreen({super.key});

  static const String routeName = 'facilities_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FacilitiesCubit()..loadAllFacilities(),
      child: Scaffold(
        body: FacilitiesScreenBody(),
      ),
    );
  }
}
