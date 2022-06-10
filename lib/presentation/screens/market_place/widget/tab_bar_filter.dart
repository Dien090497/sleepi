import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        Container(
          constraints: BoxConstraints(maxWidth: 140.w),
          child: SFDropDownRotation(
            dropdownHeight: 40,
            dropdownWidth: 140,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            value: LocaleKeys.low_price.tr(),
            spinnerItems: [
              LocaleKeys.low_price.tr(),
              LocaleKeys.high_price.tr()
            ],
            onChange: (int value, int index) {},
          ),
        ),
        SFSubTabBar(texts: tabTexts),
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
