



import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/select_insurance/data/repos/select_insurance_repo.dart';
import 'package:salamaty/features/select_insurance/presentation/cubit/select_insurance_cubit.dart';
import 'package:salamaty/features/select_insurance/presentation/view/widgets/insurance_screen_body.dart';

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({super.key});

  static const String routeName = 'insurance';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InsuranceCubit(
        repo: InsuranceRepo(
          dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
        ),
      ),
      child: Builder(
        builder: (context) => const Scaffold(body: InsuranceScreenBody()),
      ),
    );
  }
}
