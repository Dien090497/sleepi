import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/theme.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/global_wallet/global_wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_cubit.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigationBloc()),
        BlocProvider(create: (_) => SplashCubit()..init()),
        BlocProvider(create: (_) => GlobalWalletCubit()),
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return MaterialApp(
            // key: Key(context.locale.languageCode),
            title: 'SleeFi',
            home: child,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: lightTheme,
            routes: AppRoutes.routes,
            initialRoute: R.loginSignUp,
            debugShowCheckedModeBanner: false,
            navigatorObservers: [routeObserver],
          );
        },
      ),
    );
  }
}
