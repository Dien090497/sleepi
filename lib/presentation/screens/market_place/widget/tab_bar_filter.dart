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
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/resources/resources.dart';

class TabBarFilter extends StatelessWidget {
  const TabBarFilter(
      {Key? key,
      this.onFilterTap,
      required this.tabTexts,
      this.padding,
      required this.cubit})
      : super(key: key);

  final VoidCallback? onFilterTap;
  final List<String> tabTexts;
  final EdgeInsets? padding;
  final MarketPlaceCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SFDropDownRotation(
            dropdownHeight: 40,
            dropdownWidth: 110,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            value: LocaleKeys.low_price.tr(),
            spinnerItems: [
              LocaleKeys.low_price.tr(),
              LocaleKeys.high_price.tr(),
              LocaleKeys.latest.tr(),
            ],
            onChange: (int value, int index) {
              cubit.selectPrice(index);
            },
          ),
          Expanded(
              child: SFSubTabBar(
            texts: tabTexts,
            isScrollable: false,
          )),
          const SizedBox(width: 4),
          const SFIcon(Ics.filter, color: AppColors.blue),
          TextButton(
            onPressed: onFilterTap,
            child: SFText(
              keyText: LocaleKeys.filter,
              style: TextStyles.blue16W700,
            ),
          ),
        ],
      ),
    );
  }
}
