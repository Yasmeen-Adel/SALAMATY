


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/insurance_services/data/repos/insurance_services_repo.dart';
import 'package:salamaty/features/insurance_services/presentation/cubit/insurance_services_cubit.dart';
import 'package:salamaty/features/insurance_services/presentation/view/widgets/insurance_services_screen_body.dart';

class InsuranceServicesScreen extends StatelessWidget {
  const InsuranceServicesScreen({super.key});

  static const String routeName = 'insurance_services_screen';

  @override
  Widget build(BuildContext context) {
    final providerId = ModalRoute.of(context)?.settings.arguments as int? ?? 0;

    return BlocProvider(
      create: (_) => InsuranceServicesCubit(
        repo: InsuranceServicesRepo(
          dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
        ),
        providerId: providerId,
      ),
      child: const Scaffold(
        body: InsuranceServicesScreenBody(),
      ),
    );
  }
}

class InsuranceServicesScreenWithId extends StatelessWidget {
  final int providerId;

  const InsuranceServicesScreenWithId({super.key, required this.providerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InsuranceServicesCubit(
        repo: InsuranceServicesRepo(
          dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
        ),
        providerId: providerId,
      ),
      child: const InsuranceServicesScreenBody(),
    );
  }
}