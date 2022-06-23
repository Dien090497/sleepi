import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class TabBarIcon extends TabBar {
  TabBarIcon({
    required context,
    required List<String> texts,
    required List<String> images,
    required Function(int) onTap,
    required int index,
    required TabController tabController,
    Key? key,
  }) : super(
          controller: tabController,
          onTap: onTap,
          tabs: List.generate(
              texts.length,
              (i) => Tab(
                    height: 40,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SFIcon(
                            images.isNotEmpty ? images[i] : "",
                            color:
                                i == index ? AppColors.white : AppColors.purple,
                            width: 24,
                          ),
                          const SizedBox(width: 4),
                          SFText(
                            keyText: texts[i],
                            style: i == index
                                ? const TextStyle(color: AppColors.white)
                                : const TextStyle(color: AppColors.purple),
                          ),
                        ],
                      ),
                    ),
                  )),

          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: AppColors.gradientBluePurple,
              color: AppColors.blue),

          indicatorColor: AppColors.purple,
          labelColor: AppColors.white,
          // labelStyle: const TextStyle(color: AppColors.white),
          unselectedLabelColor: AppColors.purple,
          // unselectedLabelStyle: const TextStyle(color: AppColors.purple),
          splashBorderRadius: BorderRadius.circular(100),

          // padding: const EdgeInsets.symmetric(horizontal: 12),
          key: key,
        );
}
