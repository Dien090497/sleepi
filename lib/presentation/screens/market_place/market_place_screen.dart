import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_beds_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_items_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_jewels_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_trophys_buy.dart';

class MarketPlaceScreen extends StatelessWidget {
  const MarketPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TopBarCommon(),
            SizedBox(height: 20),
            Expanded(
              child: SFTabBar(
                isScrollable: true,
                texts: [
                  LocaleKeys.beds,
                  LocaleKeys.jewels,
                  LocaleKeys.item,
                  LocaleKeys.trophy
                ],
                children: [
                  TabBedsBuy(),
                  TabJewelsBuy(),
                  TabItemsBuy(),
                  TabTrophysBuy(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
