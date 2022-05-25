import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_bottom_navigator_home.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Future.delayed(const Duration(milliseconds: 600), () {
      //   Navigator.pushNamed(context, R.tutorial);
      // });
    });

    return BackgroundWidget(
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, navState) {
          final navBloc = context.read<BottomNavigationBloc>();
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: SFBottomNavigatorHome(
              navState.tabIndex,
              onTap: (i) {
                navBloc.add(SelectTab(i));
              },
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
