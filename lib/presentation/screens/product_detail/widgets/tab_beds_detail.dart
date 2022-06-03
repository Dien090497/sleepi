import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/gridview_bed_item.dart';

class TabBedsDetail extends StatelessWidget {
  //   showCustomDialog(
  //     context,
  //     padding: const EdgeInsets.all(24),
  //     children: [
  //       PopUpBedsDetail(
  //         icon: Ics.sleep,
  //         level: 1,
  //         cost: 2,
  //         time: 1200,
  //         onConfirm: () {},
  //         onCancel: () {
  //           Navigator.pop(context);
  //         },
  //       ),
  //     ],
  //   );
  // }
  const TabBedsDetail({Key? key}) : super(key: key);

  // void _showBedDialog(BuildContext context) {

  @override
  Widget build(BuildContext context) {
    final beds = List.generate(BedType.values.length * 5,
        (i) => BedType.values[i % BedType.values.length]);

    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFSubTabBar(texts: const [LocaleKeys.beds, LocaleKeys.bed_box]),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                GridViewBedItem(
                    beds: beds,
                    onBedTap: (bed) {
                      Navigator.pushNamed(context, R.nftInfo);
                    }),
                GridViewBedItem(
                    beds: beds,
                    onBedTap: (bed) {
                      Navigator.pushNamed(context, R.nftInfo);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
