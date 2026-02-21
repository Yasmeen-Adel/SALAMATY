import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final AuthRepo _repo = getIt<AuthRepo>();

  Future<void> loadUserData() async {
    emit(HomeLoading());

    try {
      final response = await _repo.getProfile();

      final data = response["data"];

      emit(HomeLoaded(
        fullName: data["fullName"] ?? "User",
        imageUrl: data["imageUrl"],
      ));
    } catch (e) {
      emit(HomeError());
    }
  }
}