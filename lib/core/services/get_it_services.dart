import 'package:get_it/get_it.dart';
import 'package:salamaty/core/services/localization_provider.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';

final GetIt getIt = GetIt.instance;
void setupGetIt() {
    getIt.registerLazySingleton<LocalizationProvider>(
        () => LocalizationProvider(),
  );
    getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(),
  );
}
