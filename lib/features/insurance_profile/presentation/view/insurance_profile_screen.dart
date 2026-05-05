

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/insurance_profile/data/repos/insurance_profile_repo.dart';
import 'package:salamaty/features/insurance_profile/presentation/cubit/insurance_profile_cubit.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/insurance_profile_body.dart';

class InsuranceProfileScreen extends StatelessWidget {
  const InsuranceProfileScreen({super.key});

  static const String routeName = 'insurance_profile';

  // نفس الـ userId الثابت — استبدله بالـ AuthCubit لما يبقى جاهز
  static const String _userId = '948f6f27-86b5-4545-864d-180c105632eb';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InsuranceProfileCubit(
        repo: InsuranceProfileRepo(
          dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
        ),
      )..fetchProfile(userId: _userId),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: InsuranceProfileBody(),
      ),
    );
  }
}