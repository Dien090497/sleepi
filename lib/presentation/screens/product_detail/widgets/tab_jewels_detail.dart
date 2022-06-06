import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/jewel_dialog_body.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_short_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/upgrade_tab.dart';
import 'package:slee_fi/resources/resources.dart';

class TabJewelsDetail extends StatelessWidget {
  const TabJewelsDetail({Key? key}) : super(key: key);

  void _showJewelDialog(BuildContext context, String img) {
    showCustomDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: [
        JewelDialogBody(
          icon: img,
          name: 'name',
          level: 'Lv.1',
          id: '12345678910',
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
    final jewels = [
      Imgs.jewelGreen,
      Imgs.jewelPurple,
      Imgs.jewelBlue,
      Imgs.jewelRed
    ];

    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFSubTabBar(texts: const [LocaleKeys.jewels, LocaleKeys.upgrade]),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                SFGridView(
                  count: jewels.length * 3,
                  childAspectRatio: 1,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        _showJewelDialog(context, jewels[i]);
                      },
                      child: MyJewelsShortWidget(
                        icon: jewels[i % jewels.length],
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
    );
  }
}
