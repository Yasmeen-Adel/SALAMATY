import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/features/home/data/home_repo.dart';
import 'package:salamaty/features/home/data/models/tip_model.dart';
import 'package:salamaty/features/profile/data/profile_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ProfileRepo _profileRepo = getIt<ProfileRepo>();
  final HomeRepo _homeRepo = getIt<HomeRepo>();


  Future<void> loadHomeData() async {
    emit(HomeLoading());

    try {
      final profileResponse = await _profileRepo.getProfile();
      final tipsResponse = await _homeRepo.getTips();

      // user data
      final userData = profileResponse["data"];
      final String fullName = userData["fullName"] ?? "User";
      final String? imageUrl = userData["imageUrl"];

      // tips
      final allTips =
          tipsResponse.map<TipModel>((tip) => TipModel.fromJson(tip)).toList();

      allTips.shuffle();
      final List<TipModel> randomThree = allTips.take(3).toList();

      emit(HomeSuccess(
        fullName: fullName,
        imageUrl: imageUrl,
        tips: randomThree,
      ));
    } catch (e) {
      emit(HomeError());
    }
  }
}
