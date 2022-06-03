import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class TabBarIcon extends TabBar {
  TabBarIcon({
    required context,
    required List<String> texts,
    required List<String> images,
    required Function(int) onTap,
    required int index,
    Key? key,
  }) : super(
          onTap: onTap,
          tabs: List.generate(
              texts.length,
              (i) => Tab(
                    height: 40,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SFIcon(
                          images.isNotEmpty ? images[i] : "",
                          color:
                              i == index ? AppColors.white : AppColors.purple,
                          width: 24,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                            child: SFText(
                          keyText: texts[i],
                          style: i == index
                              ? TextStyles.white16
                              : TextStyles.purple16,
                        )),
                      ],
                    ),
                  )),

          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: AppColors.gradientBluePurple,
              color: AppColors.blue),

          indicatorColor: AppColors.purple,
          labelColor: AppColors.white,
          labelStyle: TextStyles.white16,
          unselectedLabelColor: AppColors.purple,
          unselectedLabelStyle: TextStyles.purple16,
          splashBorderRadius: BorderRadius.circular(100),

          // padding: const EdgeInsets.symmetric(horizontal: 12),
          key: key,
        );
}
