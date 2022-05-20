import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class TabBarIcon extends TabBar {
  TabBarIcon({
    required List<String> texts,
    required List<IconData> icons,
    Key? key,
  }) : super(
    tabs: List.generate(
        texts.length,
            (i) => Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icons.isNotEmpty ? icons[i] : null),
                  const SizedBox(width: 8),
                  Expanded(child: Text(translate(texts[i]))),
                ],
              ),
        )),
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: AppColors.greyBottomNavBar,
    ),
    indicatorColor: AppColors.transparent,
    // padding: const EdgeInsets.symmetric(horizontal: 12),
    key: key,
  );
}
