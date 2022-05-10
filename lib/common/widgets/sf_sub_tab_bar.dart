import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFSubTabBar extends TabBar {
  SFSubTabBar({
    required List<String> texts,
    Key? key,
  }) : super(
          tabs: List.generate(
              texts.length,
              (i) => Tab(
                    text: translate(texts[i]),
                  )),
          isScrollable: true,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.greyBottomNavBar,
          ),
          indicatorColor: AppColors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          key: key,
        );
}
