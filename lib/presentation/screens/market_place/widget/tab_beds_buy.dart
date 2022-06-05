import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/gridview_bed_item.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/jewel_dialog_body.dart';
import 'package:slee_fi/resources/resources.dart';

class TabBedsBuy extends StatelessWidget {
  const TabBedsBuy({Key? key, required this.onPress}) : super(key: key);

  final Function() onPress;

  void _showBedDialog(BuildContext context) {
    showCustomDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: [
        JewelDialogBody(
          icon: Imgs.jewelGreen,
          name: 'name',
          level: 'level',
          id: 'id',
          attribute: 'attribute',
          effect: 'effect',
          onSellTap: () {},
          onTransferTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final beds = List.generate(BedType.values.length * 5,
        (i) => BedType.values[i % BedType.values.length]);

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
                  GridViewBedItem(
                    beds: beds,
                    price: 10,
                    onBuyTap: (bed) {
                      Navigator.pushNamed(context, R.nftInfo,
                          arguments: true);
                    },
                  ),
                  GridViewBedItem(
                    beds: beds,
                    onBedTap: (bed) {
                      _showBedDialog(context);
                    },
                    price: 10,
                    onBuyTap: (bed) {

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
