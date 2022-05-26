import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_short_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class TabJewelsDetail extends StatelessWidget {
  const TabJewelsDetail({Key? key}) : super(key: key);

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
        children: [
          SFSubTabBar(
            texts: const [Keys.jewels, Keys.upgrade],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                SFGridView(
                  count: jewels.length * 3,
                  childAspectRatio: 1,
                  itemBuilder: (context, i) {
                    return MyJewelsShortWidget(
                      icon: jewels[i % jewels.length],
                    );
                  },
                ),
                SFGridView(
                  count: jewels.length,
                  itemBuilder: (context, i) {
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
