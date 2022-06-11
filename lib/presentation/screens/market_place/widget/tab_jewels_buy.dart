import 'package:flutter/material.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_jewel_market_place.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';

import 'jewel_buy_widget.dart';

class TabJewelsBuy extends StatelessWidget {
  const TabJewelsBuy({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  void _showJewelDialog(BuildContext context, String img, String id) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpJewelMarketPlace(
        icon: img,
        name: 'name',
        level: 'Lv.1',
        id: id,
        attribute: 'attribute',
        effect: 'effect',
        onConfirmTap: () {
          Navigator.pop(context);
          showSuccessfulDialog(context);
        },
      ),
    );
  }

  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    final jewels = [
      Imgs.jewelSliver,
      Imgs.jewelPurple,
      Imgs.jewelGreen,
      Imgs.jewelRed
    ];
    final randomUtils = getIt<RandomUtils>();

    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBarFilter(
              tabTexts: const [LocaleKeys.buy, LocaleKeys.rent],
              onFilterTap: () {
                showFilterModalBottomSheet(context, FilterType.jewel);
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  SFGridView(
                    count: 20,
                    childAspectRatio: 8/10,
                    itemBuilder: (context, i) {
                      String id = randomUtils.randomId();
                      return GestureDetector(
                        onTap: () {
                          _showJewelDialog(context, jewels[i], id);
                        },
                        child: JewelsBuyWidget(
                          id: id,
                          icon: jewels[i % jewels.length],
                          onPressedButton: () {
                            _showJewelDialog(context, jewels[i], id);
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.3),
                    child: const Center(
                      child: SFIcon(Ics.commingSoon),
                    ),
                  )
                  // SFGridView(
                  //   count: 20,
                  //   itemBuilder: (context, i) {
                  //     return ItemBedBuyWidget(
                  //       icon: jewels[i % jewels.length],
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
