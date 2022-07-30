import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/utils/appsflyer_custom.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_bottom_navigator_home.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/screens/chart/chart_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/gacha_screen.dart';
import 'package:slee_fi/presentation/screens/home/home_screen.dart';
import 'package:slee_fi/presentation/screens/market_place/market_place_screen.dart';
import 'package:slee_fi/presentation/screens/product_detail/product_detail_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WalletCubit>().checkWallet();
    final app = getIt<AppFlyerCustom>();
    final GlobalKey<SFTabBarState> marketTabKey = GlobalKey();
    final PageController pageController = PageController();

    var screens = [
      const HomeScreen(),
      const GachaScreen(),
      ProductDetailScreen(),
      const ChartScreen(),
      MarketPlaceScreen(tabKey: marketTabKey),
    ];

    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      listener: (context, state) {
        if (state.tabIndex != null) {
          pageController.jumpToPage(state.tabIndex!);
          if (state.tabIndexChild != null) {
            Future.delayed(
                const Duration(milliseconds: 300),
                () =>
                    marketTabKey.currentState?.moveToTab(state.tabIndexChild!));
          }
        }
      },
      builder: (context, navState) {
        return BackgroundWidget(
          extendBody: false,
          bottomNavigationBar: SFBottomNavigatorHome(
            onTap: (i) {
              pageController.jumpToPage(i);
              app.homeAction(i);
            },
            pageController: pageController,
          ),
          child: PageView.builder(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: screens.length,
            itemBuilder: (_, i) => screens[i],
          ),
        );
      },
    );
  }
}
