import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_dropdown_rotation.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class TabBarFilter extends StatelessWidget {
  const TabBarFilter({Key? key, this.onFilterTap, required this.tabTexts})
      : super(key: key);

  final VoidCallback? onFilterTap;
  final List<String> tabTexts;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SFDropDownRotation(
          dropdownHeight: 40,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          value: LocaleKeys.low_price.tr(),
          spinnerItems: [LocaleKeys.low_price.tr(), LocaleKeys.high_price.tr()],
          onChange: (int value, int index) {},
        ),
        const SizedBox(width: 4),
        SFSubTabBar(texts: tabTexts),
        const SizedBox(width: 4),
        Expanded(
          child: GestureDetector(
            onTap: onFilterTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SFIcon(Ics.filter, color: AppColors.blue),
                const SizedBox(width: 4),
                Expanded(
                  child: SFText(
                      keyText: LocaleKeys.filter, style: TextStyles.blue16W700),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
