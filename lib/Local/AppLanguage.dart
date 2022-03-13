import 'package:flutter/material.dart';
import 'package:fssmarthome/Local/LanguageHelper.dart';

class AppLanguage with ChangeNotifier {
  late String currentLanguage;
  late Locale locale=new Locale("en");

  LanguageHelper languageHelper = LanguageHelper();

  Locale get getlocale => locale;

  void changeLocale(String newLocale) {
    Locale convertedLocale;
    currentLanguage = newLocale;
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);
    locale = convertedLocale;
    notifyListeners();
  }

  defineCurrentLanguage(context) {
    String definedCurrentLanguage;

    if (currentLanguage != null)
      definedCurrentLanguage = currentLanguage;
    else {
      print(
          "locale from currentData: ${Localizations.localeOf(context).toString()}");
      definedCurrentLanguage = languageHelper
          .convertLocaleToLangName(Localizations.localeOf(context).toString());
    }

    return definedCurrentLanguage;
  }
}