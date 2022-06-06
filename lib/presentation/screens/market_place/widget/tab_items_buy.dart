import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/item_bed_buy_widget.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';

class TabItemsBuy extends StatelessWidget {
  const TabItemsBuy({Key? key, required this.onPress}) : super(key: key);

  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    final beds = [
    Ics.shortBed,
    Ics.middleBed,
    Ics.flexibleBed,
      Ics.longBed,
    ];
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
                showFilterModalBottomSheet(context);
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  SFGridView(
                    count: 20,
                    itemBuilder: (context, i) {
                      return ItemBedBuyWidget(
                        icon: beds[i % beds.length],
                      );
                    },
                  ),
                  SFGridView(
                    count: 20,
                    itemBuilder: (context, i) {
                      return ItemBedBuyWidget(
                        icon: beds[i % beds.length],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
