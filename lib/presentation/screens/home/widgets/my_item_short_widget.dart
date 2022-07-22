import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class MyItemsShortWidget extends StatelessWidget {
  const MyItemsShortWidget(
      {required this.name,
      required this.image,
      this.color,
      Key? key,
      required this.level,
      required this.type,
      this.quality})
      : super(key: key);

  final String image;
  final String type;
  final int level;
  final Color? color;
  final String name;
  final String? quality;

  @override
  Widget build(BuildContext context) {
    final qualityColor =
        quality != null ? quality!.qualityBedColor : AppColors.commonBed;
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.lightDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: 14,
            left: -30,
            child: TopLeftBanner(
              text: type.reCase(StringCase.camelCase),
              textColor: qualityColor,
              backgroundColor: qualityColor.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedImage(image: image, width: 60, height: 60),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: qualityColor.withOpacity(0.1)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: SFText(
                    keyText: name.toString(),
                    style: TextStyles.white1w700size12
                        .copyWith(color: qualityColor),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: SFText(
                      keyText: '${LocaleKeys.level.tr()} $level',
                      style: TextStyles.lightGrey11W500),
                ),
                SizedBox(height: 4.h),
                SFPercentBorderGradient(
                    valueActive: math.min(level * 1.0, 5), totalValue: 5),
                const SizedBox(height: 12)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
