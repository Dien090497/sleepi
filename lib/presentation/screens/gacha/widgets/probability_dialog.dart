import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ProbabilityDialog extends StatelessWidget {
  const ProbabilityDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final List<Map> users = [
      {'title': LocaleKeys.bed, 'content': 'Common Bed 99999%\nUncommon Bed 9999%\nRare Bed 9999%\nEpic Bed 9999%\nLegendaly Bed 9999%'},
      {'title': LocaleKeys.jewels, 'content': 'Level1 9999%\nLevel2 9999%\nLevel3 9999%\nLevel4 9999%\nLevel5 9999%'},
      {'title': LocaleKeys.item, 'content': 'Level1 9999%\nLevel2 9999%\nLevel3 9999%\nLevel4 9999%\nLevel5 9999%'},
      {'title': LocaleKeys.token, 'content': '999999SLFT  9999%\n999999SLFT  9999%\n999999SLFT  9999%\n999999SLGT  9999%\n999999SLGT  9999%\n999999SLGT  9999%\n999999SLGT  9999%\n999999SLGT  9999%'},
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          SFText(
            keyText: LocaleKeys.probability,
            style: TextStyles.bold18LightWhite,
          ),
          const SizedBox(
            height: 24,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8),),
                    color: AppColors.white.withOpacity(0.05),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SFText(keyText: LocaleKeys.product_line_up, style: TextStyles.bold14LightWhite,),
                ),
                Table(
                  columnWidths: const {
                    0: FixedColumnWidth(100),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: users.map((user) {
                    return TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                                color: users.indexOf(user) % 2 == 0
                                    ? AppColors.transparent
                                    : AppColors.white.withOpacity(0.03),
                                padding: const EdgeInsets.all(10),
                                child: Center(child: SFText(keyText: user["title"], style: TextStyles.bold14Blue, textAlign: TextAlign.center,))),
                          ),
                      Container(
                          color: users.indexOf(user) % 2 == 0
                              ? AppColors.transparent
                              : AppColors.white.withOpacity(0.03),
                          padding: const EdgeInsets.all(10),
                          child: SFText(keyText : user['content'], style: TextStyles.w400lightGrey14))
                    ]);
                  }).toList(),
                  border: TableBorder.all(width: 1, color: AppColors.white.withOpacity(0.1),
                      borderRadius:  const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
