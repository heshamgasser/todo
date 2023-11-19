import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String languageCode = 'en';

  void changeLanguageCode (String selectedLanguageCode) async{
    if (languageCode == selectedLanguageCode) return;
    languageCode = selectedLanguageCode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', languageCode);
    notifyListeners();
  }

ThemeMode themeMode = ThemeMode.system;

  void changeThemeMode (ThemeMode selectedThemeMode) async{
    if (themeMode == selectedThemeMode) return;
    themeMode = selectedThemeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', themeMode == ThemeMode.light ? 'Light Theme' : 'Dark Theme');
    notifyListeners();
  }

void getSavedSettings () async{
 
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('lang') ?? 'en';
    changeLanguageCode(lang);
    String theme = prefs.getString('theme') ?? 'Light Theme';
   changeThemeMode(theme == 'Light Theme' ? ThemeMode.light : ThemeMode.dark);
}


}