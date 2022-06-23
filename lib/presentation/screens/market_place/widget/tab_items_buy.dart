import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/item_bed_buy_widget.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_item_market_place.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';

class TabItemsBuy extends StatelessWidget {
  const TabItemsBuy({Key? key}) : super(key: key);

  void _showItemDialog(BuildContext context, String img, String id) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpItemMarketPlace(
        icon: img,
        level: 'Lv.1',
        id: id,
        onConfirmTap: () {
          Navigator.pop(context);
          showSuccessfulDialog(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(ItemType.values.length * 5,
        (i) => ItemType.values[i % ItemType.values.length]);
    final randomUtils = getIt<RandomUtils>();

    return DefaultTabController(
      length: 2,
      child: Column(
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SFGridView(
                          count: items.length,
                          isScroll: true,
                          childAspectRatio: 8 / 10,
                          itemBuilder: (context, i) {
                            String id = randomUtils.randomId();
                            return GestureDetector(
                              onTap: () {
                                _showItemDialog(context, items[i].image, id);
                              },
                              child: ItemBedBuyWidget(
                                id: id,
                                item: items[i % ItemType.values.length],
                                onPressedButton: () {
                                  _showItemDialog(context, items[i].image, id);
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
