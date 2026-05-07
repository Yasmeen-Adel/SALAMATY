import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/core/services/localization_provider.dart';
import 'package:salamaty/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salamaty/core/helper_functions/on_generate_route.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();

  // Setup GetIt for singletons
  setupGetIt();
  // final isLoggedIn = await AuthLocalStorage.isLoggedIn();
  runApp(
    ChangeNotifierProvider<LocalizationProvider>(
      create: (_) => getIt<LocalizationProvider>(),
      child: SalamatyApp(),
    ),
  );
}

class SalamatyApp extends StatelessWidget {
  // final bool isLoggedIn;

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
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      // home: ChatbotScreen(),
    );
  }
}
