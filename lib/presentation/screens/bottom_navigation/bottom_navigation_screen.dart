import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Future.delayed(const Duration(milliseconds: 600), () {
    //     Navigator.pushNamed(context, R.tutorial);
    //   });
    // });

    return BackgroundWidget(
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, navState) {
          final navBloc = context.read<BottomNavigationBloc>();

          return Scaffold(
            extendBody: true,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary, width: 2)),
                child: BottomNavigationBar(
                  backgroundColor: AppColors.greyBottomNavBar,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  unselectedFontSize: 0.0,
                  selectedFontSize: 0.0,
                  type: BottomNavigationBarType.fixed,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/home_page.png',
                        width: 35,
                        height: 35,
                      ),
                      activeIcon: Image.asset(
                        'assets/images/home_page.png',
                        width: 35,
                        height: 35,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/gacha.png',
                        width: 35,
                        height: 35,
                      ),
                      activeIcon: Image.asset(
                        'assets/images/gacha.png',
                        width: 35,
                        height: 35,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/product_detail.png',
                        width: 35,
                        height: 35,
                      ),
                      activeIcon: Image.asset(
                        'assets/images/product_detail.png',
                        width: 35,
                        height: 35,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/statistics.png',
                        width: 35,
                        height: 35,
                      ),
                      activeIcon: Image.asset(
                        'assets/images/statistics.png',
                        width: 35,
                        height: 35,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/market.png',
                        width: 35,
                        height: 35,
                      ),
                      activeIcon: Image.asset(
                        'assets/images/market.png',
                        width: 35,
                        height: 35,
                      ),
                      label: '',
                    ),
                  ],
                  currentIndex: navState.tabIndex,
                  selectedItemColor: AppColors.primary,
                  onTap: (i) {
                    navBloc.add(SelectTab(i));
                  },
                ),
              ),
            ),
            body: IndexedStack(
              index: navState.tabIndex,
              children: const [
                HomeScreen(),
                GachaScreen(),
                ProductDetaiScreen(),
                ChartScreen(),
                MarketPlaceScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
