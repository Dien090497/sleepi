import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/theme.dart';
import 'package:slee_fi/common/widgets/phoenix.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/global_listener/global_listener_cubit.dart';
import 'package:slee_fi/presentation/blocs/refresh_cubit/refresh_cubit.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';

import 'common/style/text_styles.dart';
import 'common/widgets/sf_text.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => BottomNavigationBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => WalletCubit()),
          BlocProvider(create: (_) => RefreshCubit()),
          BlocProvider(create: (_) => GlobalListenerCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, child) {
            return RefreshConfiguration(
              headerBuilder: () => const WaterDropHeader(),
              footerBuilder: () => CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = SFText(
                      keyText: LocaleKeys.pull_up_load,
                      style: TextStyles.lightWhite16,
                    );
                  } else if (mode == LoadStatus.loading) {
                    body = const CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = SFText(
                      keyText: LocaleKeys.load_fail_retry,
                      style: TextStyles.lightWhite16,
                    );
                  } else if (mode == LoadStatus.canLoading) {
                    // body = SFText(
                    //   keyText: LocaleKeys.release_to_load_more,
                    //   style: TextStyles.lightWhite16,
                    // );
                    body = const CupertinoActivityIndicator();
                  } else {
                    body = SFText(
                      keyText: LocaleKeys.no_more_data,
                      style: TextStyles.lightWhite16,
                    );
                  }
                  return SizedBox(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
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
                navigatorKey: navKey,
                navigatorObservers: [
                  routeObserver,
                  SentryNavigatorObserver(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

final navKey = GlobalKey<NavigatorState>();
