import 'package:slee_fi/presentation/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:slee_fi/presentation/screens/home/home_screen.dart';

class R {
  static const String _ = '/';
  static const String home = '${_}home';
  static const String bottom_navigation = '${_}bottom_navigation';
}

class AppRoutes {
  static final routes = {
    R.home: (_) => const HomeScreen(),
    R.bottom_navigation: (_) => const BottomNavigationScreen(),
  };
}
