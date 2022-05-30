  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/theme.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigationBloc()),
      ],
      child: LocalizationProvider(
        state: LocalizationProvider.of(context).state,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
              title: 'SleeFi',
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                localizationDelegate,
              ],
              home: child,
              supportedLocales: localizationDelegate.supportedLocales,
              locale: localizationDelegate.currentLocale,
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              routes: AppRoutes.routes,
              initialRoute: R.loginSignUp,
            );
          },
        ),
      ),
    );
  }
}
