import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SharedPreferenceDataSource {
  final SharedPreferences _sp;

  SharedPreferenceDataSource(this._sp);

  Future<bool> setLoggedIn() => _sp.setBool(_isLoggedInKey, true);

  bool isLoggedIn() => _sp.getBool(_isLoggedInKey) ?? false;

  bool hasShownTutorial() => _sp.getBool(_hasShownTutorial) ?? false;

  Future<bool> setHasShownTutorial() => _sp.setBool(_hasShownTutorial, true);
}

const String _isLoggedInKey = 'is_logged_in';
const String _hasShownTutorial = 'has_shown_tutorial';
