import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_drop_down.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class TabBarFilter extends StatelessWidget {
  const TabBarFilter({Key? key, this.onFilterTap, required this.tabTexts})
      : super(key: key);

  final VoidCallback? onFilterTap;
  final List<String> tabTexts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 140.w),
            child: SFDropDown(
              value: 'Low Price',
              dropdownItems: [
                DropdownMenuItem(
                  value: 'Low Price',
                  child: SFText(
                    keyText: 'Low Price',
                    style: TextStyles.white16,
                  ),
                ),
                DropdownMenuItem(
                  value: 'High Price',
                  child: SFText(
                    keyText: 'High Price',
                    style: TextStyles.white16,
                  ),
                ),
              ],
            ),
          ),
          SFSubTabBar(texts: tabTexts),
          GestureDetector(
            onTap: onFilterTap,
            child: Row(
              children: [
                const SFIcon(Ics.filter, color: AppColors.blue),
                const SizedBox(width: 4),
                SFText(keyText: Keys.filter, style: TextStyles.blue16W700),
              ],
            ),
          ),
        ],
      ),
    );
  }
}