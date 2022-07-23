import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/bed_entity_x.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class JewelDialogBodyUpgradeSuccess extends StatelessWidget {
  const JewelDialogBodyUpgradeSuccess({Key? key, required this.jewel})
      : super(key: key);

  final BedEntity jewel;

  @override
  Widget build(BuildContext context) {
    final qualityColor = jewel.quality?.qualityBedColor ?? AppColors.commonBed;
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.pink.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: CachedImage(
                image: jewel.image,
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(height: 20),
            SFText(
              keyText:
                  '${jewel.jewelType?.tr() ?? ''} ${LocaleKeys.jewel.tr()} (Lv.${jewel.level})',
              style: TextStyles.white1w700size16,
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: qualityColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(8),
              child: SFText(
                keyText: jewel.nftId.toString(),
                style: TextStyles.blue14.copyWith(color: qualityColor),
              ),
            ),
            const SizedBox(height: 32),
            SFCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
              child: Row(
                children: [
                  SFText(
                    keyText: LocaleKeys.effect,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SFText(
                      keyText:
                          '${jewel.infoBuff}% ${LocaleKeys.base.tr()} ${jewel.type.tr()}',
                      style: TextStyles.blue16,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: SFButton(
                  text: LocaleKeys.ok,
                  onPressed: () => Navigator.pop(context),
                  textStyle: TextStyles.white16,
                  gradient: AppColors.blueGradient,
                  width: double.infinity,
                )),
          ],
        ),
      ],
    );
  }
}