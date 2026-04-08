import 'package:get_it/get_it.dart';
import 'package:salamaty/core/services/localization_provider.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'package:salamaty/features/facilities/data/facilities_repo.dart';
import 'package:salamaty/features/home/data/home_repo.dart';
import 'package:salamaty/features/profile/data/profile_repo.dart';
import 'package:salamaty/features/specialities/data/specialities_repo.dart';

final GetIt getIt = GetIt.instance;
void setupGetIt() {
    getIt.registerLazySingleton<LocalizationProvider>(
        () => LocalizationProvider(),
  );
    getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(),
  );
   getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(),
  );
   getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(),
  );
  getIt.registerLazySingleton<FacilitiesRepo>(
  () => FacilitiesRepo(),
);
  getIt.registerLazySingleton<SpecialitiesRepo>(
    () => SpecialitiesRepo(),
  );

}
