import 'dart:ui';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ITranslatePreferences)
class TranslateImplementation implements ITranslatePreferences {
  final SharedPreferences _sharedPreferences;

  TranslateImplementation(this._sharedPreferences);

  static const String _selectedLocaleKey = 'selected_locale';

  @override
  Future<Locale?> getPreferredLocale() async {
    if (!_sharedPreferences.containsKey(_selectedLocaleKey)) return null;

    final locale = _sharedPreferences.getString(_selectedLocaleKey);

    return localeFromString(locale ?? '');
  }

  @override
  Future savePreferredLocale(Locale locale) async {
    await _sharedPreferences.setString(
        _selectedLocaleKey, localeToString(locale));
  }
}
