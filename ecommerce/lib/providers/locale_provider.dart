import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';

import '../models/language_model.dart';

class LocaleCont extends ChangeNotifier {
  bool isenglish = true;

  Locale locale = Locale('en', "US");
  changeswitch_text(){
    isenglish=!isenglish;
  }

  updateLocale(Locale a) {
    locale = a;
    notifyListeners();
  }

  Locale changeLanguage(Language language, context) {
    Locale _a;
    switch (language.languageCode) {
      case AppConstants.ENGLISH:
        _a = Locale(language.languageCode, "US");
        break;
      case AppConstants.Arabic:
        _a = Locale(language.languageCode, "EG");
        break;

      default:
        _a = Locale(language.languageCode, 'US');
    }
    notifyListeners();
    return _a;
  }
}
