import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/di/translations/keys.dart';
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
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   physics: const ClampingScrollPhysics(),
            //   child: Row(
            //     children: [
            //       Container(
            //         constraints: BoxConstraints(maxWidth: 140.w),
            //         child: SFDropDown(
            //           value: 'Low Price',
            //           dropdownItems: [
            //             DropdownMenuItem(
            //               value: 'Low Price',
            //               child: SFText(
            //                 keyText: 'Low Price',
            //                 style: TextStyles.white16,
            //               ),
            //             ),
            //             DropdownMenuItem(
            //               value: 'High Price',
            //               child: SFText(
            //                 keyText: 'High Price',
            //                 style: TextStyles.white16,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SFSubTabBar(texts: const [Keys.buy, Keys.rent]),
            //       GestureDetector(
            //         onTap: () {},
            //         child: Row(
            //           children: [
            //             const SFIcon(Ics.filter, color: AppColors.blue),
            //             const SizedBox(width: 4),
            //             SFText(keyText: Keys.filter, style: TextStyles.blue16),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const TabBarFilter(tabTexts: [Keys.buy, Keys.rent]),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  GridViewBedItem(
                    beds: beds,
                    price: 10,
                    onBuyTap: (bed) {},
                  ),
                  GridViewBedItem(
                    beds: beds,
                    onBedTap: (bed) {
                      _showBedDialog(context);
                    },
                    price: 10,
                    onBuyTap: (bed) {},
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
