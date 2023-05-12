import 'package:flutter/material.dart';

class LocaleCont extends ChangeNotifier {
  Locale locale = Locale('en', "US");
  updateLocale(Locale a) {
    locale = a;
    notifyListeners();
  }
}

class Language {
  final String name;
  final String flag;
  final String languageCode;

  Language(this.name, this.flag, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language("English", "US", "en"),
      Language("Arabic", 'EG', "ar"),
    ];
  }
}