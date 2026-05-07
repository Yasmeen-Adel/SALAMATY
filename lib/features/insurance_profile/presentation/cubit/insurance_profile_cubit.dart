


import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'package:salamaty/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:salamaty/features/insurance_profile/data/repos/insurance_profile_repo.dart';

part 'insurance_profile_state.dart';

class InsuranceProfileCubit extends Cubit<InsuranceProfileState> {
  final InsuranceProfileRepo repo;

  final CancelToken _cancelToken = CancelToken();

  InsuranceProfileCubit({required this.repo})
      : super(InsuranceProfileInitial());

  Future<void> loadProfile() async {
    if (isClosed) return;

    emit(InsuranceProfileLoading());

    try {
      final userId = await AuthLocalStorage.getUserId();

      if (userId == null || userId.isEmpty) {
        emit(InsuranceProfileNoInsurance());
        return;
      }

      final profile = await repo.getProfileDetails(
        userId: userId,
        cancelToken: _cancelToken,
      );

      if (isClosed) return;

      emit(InsuranceProfileLoaded(profile: profile));
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) return;
      if (isClosed) return;

      final statusCode = e.response?.statusCode;
      final message = e.response?.data?['message']?.toString() ?? '';

      // 404 أو message فيها "not found" = مفيش insurance
      if (statusCode == 404 ||
          statusCode == 400 ||
          message.toLowerCase().contains('not found') ||
          message.toLowerCase().contains('no insurance')) {
        emit(InsuranceProfileNoInsurance());
      } else {
        emit(InsuranceProfileError(
          message: message.isNotEmpty ? message : 'Something went wrong',
        ));
      }
    } catch (e) {
      if (isClosed) return;
      emit(InsuranceProfileError(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _cancelToken.cancel("Cubit closed");
    return super.close();
  }
}