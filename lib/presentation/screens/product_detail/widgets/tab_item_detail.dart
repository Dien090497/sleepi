import 'package:flutter/material.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_item_short_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/upgrade_tab.dart';
import 'package:slee_fi/resources/resources.dart';

class TabItemDetail extends StatelessWidget {
  const TabItemDetail({Key? key}) : super(key: key);

  // void _showItemDialog(BuildContext context, String img, String id) {
  //   showCustomDialog(
  //     context,
  //     padding: const EdgeInsets.all(24),
  //     children: [
  //         ItemDialog(
  //         icon: img,
  //         name: 'name',
  //         level: 'Lv.1',
  //         id: id,
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
    final items = [
      Imgs.candyBlue,
      Imgs.candyGreen,
      Imgs.candyPink,
      Imgs.candyPurple
    ];
    final randomUtils = getIt<RandomUtils>();

    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SFSubTabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              texts: const [LocaleKeys.item, LocaleKeys.upgrade],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  SFGridView(
                    count: 20,
                    childAspectRatio: 1,
                    itemBuilder: (context, i) {
                      String randomId = randomUtils.randomId();
                      return GestureDetector(
                        onTap: () {
                          // _showItemDialog(context, items[i], randomId);
                        },
                        child: MyItemShortWidget(
                          id: randomId,
                          icon: items[i % items.length],
                        ),
                      );
                    },
                  ),
                  const UpGradeTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
