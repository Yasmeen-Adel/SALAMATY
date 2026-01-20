import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  // Locale _locale = const Locale('en');
  Locale _locale = const Locale('ar');

  LocalizationProvider() {
    _loadSavedLanguage();
  }

  Locale get locale => _locale;

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    // final lang = prefs.getString("app_lang") ?? "en";
    final lang = prefs.getString("app_lang") ?? "ar";
    _locale = Locale(lang);
    notifyListeners();
  }

  Future<void> changeLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("app_lang", langCode);

    _locale = Locale(langCode);
    notifyListeners();
  }
}
