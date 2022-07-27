import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

import 'top_left_banner.dart';

class MyItemBedBox extends StatelessWidget {
  const MyItemBedBox({
    Key? key,
    required this.bed,
    required this.onTap,
  }) : super(key: key);
  final BedEntity bed;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final qualityColor = bed.quality != null
        ? bed.quality!.qualityBedColor
        : AppColors.commonBed;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: 20,
              left: -30,
              child: TopLeftBanner(
                text: bed.quality?.reCase(StringCase.camelCase) ??
                    LocaleKeys.common,
                textColor: qualityColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: CachedImage(
                        image: bed.image,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: qualityColor.withOpacity(0.1)),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    child: SFText(
                      keyText: bed.name,
                      style: TextStyles.white1w700size12
                          .copyWith(color: qualityColor),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SFText(
                      keyText: '${LocaleKeys.level.tr()} ${bed.level}',
                      style: TextStyles.lightGrey11W500),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
