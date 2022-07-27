import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class MyJewelsShortWidget extends StatelessWidget {
  const MyJewelsShortWidget({Key? key, required this.jewel, this.color})
      : super(key: key);

  final JewelEntity jewel;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final qualityColor = jewel.quality?.qualityBedColor ?? AppColors.commonBed;
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
              text: '${LocaleKeys.level.tr()} ${jewel.level}',
              textColor: qualityColor,
              backgroundColor: qualityColor.withOpacity(0.1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedImage(
                image: jewel.image,
                width: 60,
                height: 60,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: qualityColor.withOpacity(0.1)),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: jewel.nftName,
                      maxLines: 2,
                      style: TextStyles.white1w700size12
                          .copyWith(color: qualityColor),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.green.withOpacity(0.15),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    alignment: Alignment.center,
                    child: SFText(
                        keyText: '+ ${jewel.percentEffect}%',
                        style: TextStyles.greenW700size12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
