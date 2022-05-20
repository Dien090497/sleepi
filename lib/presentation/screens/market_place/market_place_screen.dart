import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/drawer_widget.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_beds_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_items_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_jewels_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_trophys_buy.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({Key? key}) : super(key: key);

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const TopBarCommon(),
              SFTabBar(
                texts: const [Keys.beds, Keys.jewels, Keys.item, Keys.trophy],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    TabBedsBuy(
                      onPress: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
                    TabJewelsBuy(onPress: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    ),
                    TabItemsBuy(
                      onPress: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
                    const TabTrophysBuy(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
