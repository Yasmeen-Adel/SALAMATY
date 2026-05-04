import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:salamaty/features/insurance_profile/data/repos/insurance_profile_repo.dart';

part 'insurance_profile_state.dart';

class InsuranceProfileCubit extends Cubit<InsuranceProfileState> {
  final InsuranceProfileRepo repo;

  InsuranceProfileCubit({required this.repo})
      : super(InsuranceProfileInitial());

  Future<void> fetchProfile({required String userId}) async {
    emit(InsuranceProfileLoading());
    try {
      final profile = await repo.getProfileDetails(userId: userId);
      emit(InsuranceProfileLoaded(profile: profile));
    } catch (e) {
      emit(InsuranceProfileError(message: e.toString()));
    }
  }
}