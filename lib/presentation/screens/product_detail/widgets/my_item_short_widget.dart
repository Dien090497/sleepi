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
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class MyItemShortWidget extends StatelessWidget {
  const MyItemShortWidget({Key? key, required this.item}) : super(key: key);

  final BedModel item;

  @override
  Widget build(BuildContext context) {
    final qualityColor = item.quality != null
        ? item.quality!.qualityBedColor
        : AppColors.commonBed;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: 14,
            left: -30,
            child: TopLeftBanner(
              text: item.type.reCase(StringCase.camelCase),
              textColor: qualityColor,
              backgroundColor: qualityColor.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedImage(image: item.image, width: 60, height: 60),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: qualityColor.withOpacity(0.1)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: SFText(
                    keyText: item.tokenId.toString(),
                    style: TextStyles.white1w700size12
                        .copyWith(color: qualityColor),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: SFText(
                      keyText: '${LocaleKeys.level.tr()} ${item.level}',
                      style: TextStyles.lightGrey11W500),
                ),
                SizedBox(height: 4.h),
                const SFPercentBorderGradient(valueActive: 70, totalValue: 100),
                const SizedBox(height: 12)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
