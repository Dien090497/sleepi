import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SFSubTabBar extends TabBar {
  SFSubTabBar({
    required List<String> texts,
    EdgeInsets? padding,
    EdgeInsets? labelPadding,
    bool isScrollable = true,
    Key? key,
  }) : super(
          tabs: List.generate(
              // texts.length, (i) => Tab(text: translate(texts[i]))),
              texts.length,
              (i) => Tab(text: texts[i].tr())),
          isScrollable: isScrollable,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.lightGrey,
          labelStyle: TextStyles.white1w700size16,
          unselectedLabelStyle: TextStyles.lightGrey16,
          indicator: MaterialIndicator(
            bottomLeftRadius: 8,
            bottomRightRadius: 8,
            topLeftRadius: 8,
            topRightRadius: 8,
            height: 4.h,
            color: AppColors.blue,
          ),
          // indicatorWeight: 5,
          // indicatorColor: AppColors.blue,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8),
          labelPadding: labelPadding ?? EdgeInsets.zero,
          key: key,
        );
}
