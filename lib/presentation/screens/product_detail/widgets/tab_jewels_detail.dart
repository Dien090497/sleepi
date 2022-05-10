import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_short_widget.dart';

class TabJewelsDetail extends StatelessWidget {
  const TabJewelsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SFSubTabBar(
            texts: const [
              Keys.productDetailJewels,
              Keys.productDetailUpgrade,
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                SFGridView(
                  count: 20,
                  itemBuilder: (context, i) {
                    return MyJewelsShortWidget(index: i);
                  },
                ),
                SFGridView(
                  count: 20,
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
