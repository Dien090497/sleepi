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

  @override
  Widget build(BuildContext context) {
    final items = [
      Imgs.jewelGreen,
      Imgs.jewelPurple,
      Imgs.jewelBlue,
      Imgs.jewelRed
    ];
    final randomUtils = getIt<RandomUtils>();

    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFSubTabBar(
            texts: const [LocaleKeys.item, LocaleKeys.upgrade],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                SFGridView(
                  count: 20,
                  itemBuilder: (context, i) {
                    return MyItemShortWidget(
                      id: randomUtils.randomId(),
                      icon: items[i % items.length],
                    );
                  },
                ),
                const UpGradeTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
