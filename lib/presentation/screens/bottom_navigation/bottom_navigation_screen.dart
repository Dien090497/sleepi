import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/keep_alive_wrapper.dart';
import 'package:slee_fi/common/widgets/sf_bottom_navigator_home.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:slee_fi/presentation/screens/chart/chart_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/gacha_screen.dart';
import 'package:slee_fi/presentation/screens/home/home_screen.dart';
import 'package:slee_fi/presentation/screens/market_place/market_place_screen.dart';
import 'package:slee_fi/presentation/screens/product_detail/product_detail_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    const screens = [
      KeepAliveWrapper(child: HomeScreen()),
      KeepAliveWrapper(child: GachaScreen()),
      KeepAliveWrapper(child: ProductDetailScreen()),
      KeepAliveWrapper(child: ChartScreen()),
      KeepAliveWrapper(child: MarketPlaceScreen()),
    ];

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Future.delayed(const Duration(milliseconds: 600), () {
    //     Navigator.pushNamed(context, R.tutorial);
    //   });
    // });

    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, navState) {
        return BackgroundWidget(
          extendBody: false,
          bottomNavigationBar: SFBottomNavigatorHome(
            onTap: (i) {
              pageController.animateToPage(i,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.easeInQuint);
            },
            pageController: pageController,
          ),
          child: PageView.builder(
            controller: pageController,
            allowImplicitScrolling: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: screens.length,
            itemBuilder: (_, i) => screens[i],
          ),
        );
      },
    );
  }
}
