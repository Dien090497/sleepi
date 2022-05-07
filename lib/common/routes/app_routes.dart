import 'package:slee_fi/presentation/screens/home/home_screen.dart';

class R {
  static const String _ = '/';
  static const String home = '${_}home';
}

class AppRoutes {
  static final routes = {
    R.home: (_) => const HomeScreen(),
  };
}
