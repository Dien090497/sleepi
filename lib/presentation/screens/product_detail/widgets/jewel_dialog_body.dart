import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class JewelDialogBody extends StatelessWidget {
  const JewelDialogBody(
      {Key? key,
      required this.onSellTap,
      required this.onTransferTap,
      required this.jewel,
      this.textOnTransfer,
      this.textOnSell})
      : super(key: key);

  final JewelEntity jewel;
  final VoidCallback onSellTap;
  final VoidCallback onTransferTap;
  final String? textOnTransfer;
  final String? textOnSell;

  @override
  Widget build(BuildContext context) {
    final qualityColor =  jewel.quality?.qualityBedColor?? AppColors.commonBed;
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
              child: CachedNetworkImage(
                imageUrl: jewel.image,
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                    decoration: const BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Icon(Icons.error)),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(height: 20),
            SFText(
              keyText: '${LocaleKeys.luck_jewel.tr()} (${jewel.level})',
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
                    keyText: LocaleKeys.attributes,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SFText(
                      keyText: '+${jewel.luck} ${LocaleKeys.luck.tr()}',
                      style: TextStyles.blue16,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
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
                          '+${jewel.resilience}% ${LocaleKeys.base.tr()} Res.',
                      style: TextStyles.blue16,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                    child: SFButton(
                  text: textOnSell ?? LocaleKeys.sell,
                  onPressed: onSellTap,
                  textStyle: TextStyles.lightGrey16,
                  color: AppColors.whiteOpacity5,
                  width: double.infinity,
                )),
                const SizedBox(width: 12),
                Expanded(
                    child: SFButton(
                  text: textOnTransfer ?? LocaleKeys.transfer,
                  onPressed: onTransferTap,
                  textStyle: TextStyles.white16,
                  gradient: AppColors.blueGradient,
                  width: double.infinity,
                )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
