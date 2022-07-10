import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/gridview_bed_item.dart';
import 'package:slee_fi/resources/resources.dart';

class TabBedsDetail extends StatelessWidget {
  const TabBedsDetail({Key? key}) : super(key: key);

  // void _showBedDialog(BuildContext context) {
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
            SFSubTabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                texts: const [LocaleKeys.beds, LocaleKeys.bed_box]),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  GridViewBedItem(
                      beds: beds,
                      onBedTap: (bed) {
                        Navigator.pushNamed(context, R.nftInfo,
                            arguments: InfoIndividualParams(

                                /// TODO: remove example code
                                bed: BedEntity(
                                    name: 'no name',
                                    id: 1,
                                    level: 0,
                                    image: bed.image,
                                    type: 'common',
                                    contractAddress:
                                        '0x52839a88e9fdd2b137e32c65fec8e7b3f1f1ccc6',
                                    quality: 'no ',
                                    durability: 0,
                                    isLock: 0,
                                    bedMint: 5,
                                    efficiency: 5,
                                    luck: 5,
                                    bonus: 5,
                                    special: 5,
                                    resilience: 0,
                                    time: 2,
                                    isMint: 0),
                                buy: true));
                      }),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SFIcon(Ics.emptyBox),
                        const SizedBox(height: 28),
                        SFText(
                          keyText: LocaleKeys.there_is_no_item,
                          style: TextStyles.lightGrey14,
                        )
                      ],
                    ),
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
