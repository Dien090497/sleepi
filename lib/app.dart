import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/theme.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigationBloc()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => WalletCubit()..init()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return RefreshConfiguration(
            headerBuilder: () => const WaterDropHeader(),
            child: MaterialApp(
              // key: Key(context.locale.languageCode),
              title: 'SleeFi',
              home: child,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: lightTheme,
              routes: AppRoutes.routes,
              initialRoute: R.splash,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [routeObserver],
            ),
          );
        },
      ),
    );
  }
}
