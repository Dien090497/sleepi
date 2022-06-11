import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/item_bed_buy_widget.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';

class TabItemsBuy extends StatelessWidget {
  const TabItemsBuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beds = [
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
                showFilterModalBottomSheet(
                  context,
                  sections: {
                    LocaleKeys.type: [
                      LocaleKeys.efficiency.tr(),
                      LocaleKeys.luck.tr(),
                      LocaleKeys.resilience.tr(),
                      LocaleKeys.special.tr(),
                    ],
                  },
                  sliders: {
                    LocaleKeys.level:
                        const FilterSliderValues(max: 5, min: 1, interval: 2),
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  SFGridView(
                    count: 20,
                    childAspectRatio: 8 / 10,
                    itemBuilder: (context, i) {
                      return ItemBedBuyWidget(
                        id: randomUtils.randomId(),
                        icon: beds[i % beds.length],
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
