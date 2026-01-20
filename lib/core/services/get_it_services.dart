import 'package:get_it/get_it.dart';
import 'package:salamaty/core/services/localization_provider.dart';

final GetIt getIt = GetIt.instance;
void setupGetIt() {
    getIt.registerLazySingleton<LocalizationProvider>(
        () => LocalizationProvider(),
  );
}
