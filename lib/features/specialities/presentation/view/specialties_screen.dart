import 'package:flutter/material.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/features/specialities/data/specialities_repo.dart';
import 'package:salamaty/features/specialities/presentation/cubit/specialities_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/specialities/presentation/view/widgets/specialities_body.dart';

class SpecialtiesScreens extends StatelessWidget {
  final String specialtyName;

  const SpecialtiesScreens({super.key, required this.specialtyName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpecialitiesCubit(getIt<SpecialitiesRepo>()),
      child: SpecialitiesBody(specialtyName: specialtyName),
    );
  }
}
