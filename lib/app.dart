import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/theme.dart';
import 'package:slee_fi/datasources/remote/graphql/config.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigationBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return GraphQLProvider(
            client: GraphQLConfig.initializeClient(),
            child: MaterialApp(
              key: Key(context.locale.languageCode),
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
            ),
          );
        },
      ),
    );
  }
}
