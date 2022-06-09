import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
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
    int min = 65, max = 90;

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
                    var rnd = Random();
                    var id = rnd.nextDouble() * 10000;
                    while (id < 1000) {
                      id *= 10;
                    }
                    int r = min + rnd.nextInt(max - min);
                    String generateRandomString(int len) {
                      return String.fromCharCodes(List.generate(len, (index) => r));
                    }
                    return MyItemShortWidget(
                      id: '${generateRandomString(1)}${id.toInt()}',
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
