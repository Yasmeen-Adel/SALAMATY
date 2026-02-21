import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  final AuthRepo _repo = getIt<AuthRepo>();

  Map<String, dynamic>? profileData;

  Future<void> loadProfile() async {
    emit(EditProfileLoading());

    try {
      final response = await _repo.getProfile();

      if (response['success'] != true) {
        throw Exception();
      }

      profileData = response['data'];

      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailure("Failed to load profile"));
    }
  }

  Future<void> updateProfile({
    required String fullName,
    required String gender,
    required String birthDate,
    required String address,
  }) async {
    emit(EditProfileLoading());

    try {
      await _repo.editProfile(
        fullName: fullName,
        gender: gender,
        birthDate: birthDate,
        address: address,
      );

      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailure("Failed to update profile"));
    }
  }
}