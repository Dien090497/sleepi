import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/gridview_bed_item.dart';
import 'package:slee_fi/resources/resources.dart';

class TabBedsBuy extends StatelessWidget {
  const TabBedsBuy({Key? key}) : super(key: key);

  // void _showBedDialog(BuildContext context) {
  //   showCustomDialog(
  //     context,
  //     padding: const EdgeInsets.all(24),
  //     children: [
  //       JewelDialogBody(
  //         icon: Imgs.jewelGreen,
  //         name: 'name',
  //         level: 'level',
  //         id: 'id',
  //         attribute: 'attribute',
  //         effect: 'effect',
  //         onSellTap: () {},
  //         onTransferTap: () {},
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final beds = List.generate(BedType.values.length * 5,
        (i) => BedType.values[i % BedType.values.length]);

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
                  LocaleKeys.type.tr(): [
                    LocaleKeys.beds.tr(),
                    LocaleKeys.bed_box.tr(),
                  ],
                  LocaleKeys.class_.tr(): [
                    LocaleKeys.short_bed.tr(),
                    LocaleKeys.middle_bed.tr(),
                    LocaleKeys.long_bed.tr(),
                    LocaleKeys.flexible_bed.tr(),
                  ],
                  LocaleKeys.quality.tr(): [
                    LocaleKeys.common_bed.tr(),
                    LocaleKeys.uncommon_bed.tr(),
                    LocaleKeys.rare_bed.tr(),
                    LocaleKeys.epic_bed.tr(),
                    LocaleKeys.legendary_bed.tr(),
                  ],
                },
                sliders: {
                  LocaleKeys.level:
                      const FilterSliderValues(max: 50, min: 1, interval: 49),
                  LocaleKeys.mint: const FilterSliderValues(max: 7, min: 0),
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
                        GridViewBedItem(
                          beds: beds,
                          price: 10,
                          onBuyTap: (bed) {
                            Navigator.pushNamed(context, R.nftInfo,
                                arguments: true);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.3),
                          child: const Center(
                            child: SFIcon(Ics.commingSoon),
                          ),
                        )
                        // GridViewBedItem(
                        //   beds: beds,
                        //   onBedTap: (bed) {
                        //     _showBedDialog(context);
                        //   },
                        //   price: 10,
                        //   onBuyTap: (bed) {
                        //
                        //   },
                        // ),
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
