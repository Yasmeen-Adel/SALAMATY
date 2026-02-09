// import 'package:flutter/material.dart';
// import 'package:salamaty/core/helper_functions/on_generate_route.dart';
// import 'package:salamaty/features/home/presentation/view/home_screen.dart';
// import 'package:salamaty/features/home/presentation/view/widgets/main_screen.dart';
// import 'package:salamaty/features/splash/presentation/view/splash_screen.dart';

// void main() {
//   runApp(SalamatyApp());
// }

// class SalamatyApp extends StatelessWidget {
//   const SalamatyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Salamaty',
//       onGenerateRoute: onGenerateRoute,
//       initialRoute: MainScreen.routeName,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/core/services/localization_provider.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salamaty/core/helper_functions/on_generate_route.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await DioHelper.loadToken();

  // Setup GetIt for singletons
  setupGetIt();

  runApp(
    ChangeNotifierProvider<LocalizationProvider>(
      create: (_) => getIt<LocalizationProvider>(),
      child: const SalamatyApp(),
    ),
  );
}

class SalamatyApp extends StatelessWidget {
  const SalamatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.watch<LocalizationProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salamaty',
      locale: localization.locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      // home: const MainScreen(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: MainScreen.routeName,
    );
  }
}
