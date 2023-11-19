import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String languageCode = 'en';

  void changeLanguageCode (String selectedLanguageCode){
    if (languageCode == selectedLanguageCode) return;
    languageCode = selectedLanguageCode;
    notifyListeners();
  }

ThemeMode themeMode = ThemeMode.system;

  void changeThemeMode (ThemeMode selectedThemeMode){
    if (themeMode == selectedThemeMode) return;
    themeMode = selectedThemeMode;
    notifyListeners();

  }




}