import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_item.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_short_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalItemList extends StatelessWidget {
  const ModalItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jewels = [
      Imgs.jewelGreen,
      Imgs.jewelPurple,
      Imgs.jewelBlue,
      Imgs.jewelRed
    ];

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                SFText(
                  keyText: LocaleKeys.item_list,
                  style: TextStyles.bold18White,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showFilterModalBottomSheet(context, FilterType.item);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        const SFIcon(Ics.filter, color: AppColors.blue),
                        const SizedBox(width: 4),
                        SFText(
                            keyText: LocaleKeys.filter,
                            style: TextStyles.blue16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SFGridView(
                count: jewels.length * 3,
                childAspectRatio: 1,
                itemBuilder: (context, i) {
                  var rnd = Random();
                  var id = rnd.nextDouble() * 1000000;
                  while (id < 100000) {
                    id *= 10;
                  }
                  return GestureDetector(
                    onTap: () {
                      showCustomAlertDialog(context,
                          children: PopUpItem(
                            icon: Ics.middleBed,
                            onConfirm: () {},
                          ));
                    },
                    child: MyJewelsShortWidget(
                      id: id.toInt(),
                      increase: i == 2 ? false : true,
                      color: AppColors.light4,
                      icon: jewels[i % jewels.length],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16,),
          SFButton(
              text: LocaleKeys.cancel,
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              height: 48,
              onPressed: () => Navigator.pop(context)),
          const SizedBox(height: 16,)
        ],
      ),
    );
  }
}
