import 'package:slee_fi/presentation/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:slee_fi/presentation/screens/enter_activation_cde/enter_activation_code_screen.dart';
import 'package:slee_fi/presentation/screens/login_signup/login_signup_screen.dart';

class R {
  static const String _ = '/';
  static const String loginSignUp = '${_}login_signup';
  static const String enterActivationCode = '${_}enter_activation_code';
  static const String bottomNavigation = '${_}bottom_navigation';
}

class AppRoutes {
  static final routes = {
    R.loginSignUp: (_) => const LoginSignUpScreen(),
    R.enterActivationCode: (_) => const EnterActivationCodeScreen(),
    R.bottomNavigation: (_) => const BottomNavigationScreen(),
  };
}
