import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String languageCode = 'en';

  void changeLanguageCode (String selectedLanguageCode){
    if (languageCode == selectedLanguageCode) return;
    languageCode = selectedLanguageCode;
    notifyListeners();
  }






}