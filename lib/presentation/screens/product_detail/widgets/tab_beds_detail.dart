import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_bed_short_widget.dart';

class TabBedsDetail extends StatelessWidget {
  const TabBedsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beds = List.generate(BedType.values.length * 5,
        (i) => BedType.values[i % BedType.values.length]);

    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFSubTabBar(texts: const [Keys.beds, Keys.bedBox]),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                SFGridView(
                  count: beds.length,
                  itemBuilder: (context, i) {
                    return MyBedShortWidget(
                        bedType: beds[i % BedType.values.length]);
                  },
                ),
                SFGridView(
                  count: beds.length,
                  itemBuilder: (context, i) {
                    return MyBedShortWidget(
                        bedType: beds[i % BedType.values.length]);
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
