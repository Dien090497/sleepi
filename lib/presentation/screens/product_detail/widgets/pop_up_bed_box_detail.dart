import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/common/extensions/string_x.dart';

class PopUpBedBoxDetail extends StatelessWidget {
  const PopUpBedBoxDetail(
      {Key? key,
        required this.bedEntity,
        required this.onSell,
        required this.onTransfer,
        required this.onOpen})
      : super(key: key);
  final BedEntity bedEntity;
  final Function() onSell;
  final Function() onTransfer;
  final Function() onOpen;

  @override
  Widget build(BuildContext context) {
    final qualityColor =
        bedEntity.quality?.qualityBedColor ?? AppColors.commonBed;
    bool checkSelling =  (bedEntity.isLock == 1 && bedEntity.statusNftSale =='ON_SALE') ? true : false;
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
                image: bedEntity.image,
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(height: 20),
            SFText(
              keyText: '${LocaleKeys.bedbox.tr()} (Lv.${bedEntity.level})',
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
                keyText: bedEntity.name,
                style: TextStyles.blue14.copyWith(color: qualityColor),
              ),
            ),
            const SizedBox(height: 32),
            SFCard(
              radius: 8,
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SFText(
                    keyText: LocaleKeys.quality,
                    style: TextStyles.lightGrey16,
                  ),
                  SFText(
                    keyText: bedEntity.quality ?? '',
                    style: TextStyles.blue16,
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                    child: SFButton(
                      text: LocaleKeys.sell,
                      onPressed: () {
                        Navigator.pop(context);
                        onSell();
                      },
                      textStyle: TextStyles.lightGrey16,
                      color: AppColors.whiteOpacity5,
                      width: double.infinity,
                    )),
                const SizedBox(width: 12),
                Expanded(
                    child: SFButton(
                      text: LocaleKeys.transfer,
                      disabled: checkSelling,
                      onPressed: () {
                        Navigator.pop(context);
                        onTransfer();
                      },
                      textStyle: TextStyles.white16,
                      gradient: AppColors.blueGradient,
                      width: double.infinity,
                    )),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 120,
              child: SFButton(
                text: LocaleKeys.open,
                disabled: checkSelling,
                onPressed: () {
                  Navigator.pop(context);
                  onOpen();
                },
                textStyle: TextStyles.white16,
                gradient: AppColors.blueGradient,
                width: double.infinity,
              ),
            )
          ],
        ),
      ],
    );
  }
}
