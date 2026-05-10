import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/insurance_information/data/repos/insurance_information_repo.dart';
import 'package:salamaty/features/insurance_information/presentation/cubit/insurance_information_cubit.dart';
import 'package:salamaty/features/insurance_information/presentation/view/widgets/insurance_information_screen_body.dart';
import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';

class InsuranceInformationScreen extends StatelessWidget {
  const InsuranceInformationScreen({super.key});

  static const String routeName = 'insurance_information';

  @override
  Widget build(BuildContext context) {
    final provider =
        ModalRoute.of(context)!.settings.arguments as InsuranceProvider;

    return BlocProvider(
      create: (_) => InsuranceInformationCubit(
        repo: InsuranceInformationRepo(
          dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
        ),
      ),
      child: Scaffold(
        body: InsuranceInformationScreenBody(selectedProvider: provider),
      ),
    );
  }
}