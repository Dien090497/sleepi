import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/home/widgets/my_jewel_short_widget.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_item.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalItemList extends StatelessWidget {
  const ModalItemList({this.onSelected, Key? key}) : super(key: key);

  final Function(ItemType item, String id)? onSelected;

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
        12, (i) => ItemType.values[i % ItemType.values.length]);
    final randomUtils = getIt<RandomUtils>();

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
                    showFilterModalBottomSheet(
                      context,
                      sections: {
                        LocaleKeys.item: [
                          LocaleKeys.efficiency.tr(),
                          LocaleKeys.luck.tr(),
                          LocaleKeys.resilience.tr(),
                          LocaleKeys.special.tr(),
                        ]
                      },
                      sliders: {},
                    );
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
                count: items.length,
                childAspectRatio: 1,
                itemBuilder: (context, i) {
                  String id = randomUtils.randomId();
                  return GestureDetector(
                    onTap: () {
                      showCustomAlertDialog(context,
                          children: PopUpItem(
                            id: id,
                            icon: items[i],
                            onConfirm: () {
                              onSelected!(items[i], id);
                            },
                          ));
                    },
                    child: MyJewelsShortWidget(
                      id: id,
                      increase: i == 2 ? false : true,
                      color: AppColors.light4,
                      icon: items[i].image,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SFButton(
              text: LocaleKeys.cancel,
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              height: 48,
              onPressed: () => Navigator.pop(context)),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}