import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class PopUpTransferNFT extends StatelessWidget {
  const PopUpTransferNFT({Key? key, required this.bedEntity}) : super(key: key);
  final BedEntity bedEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.confirm_transfer,
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 20),
        SFCard(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SFText(
                    keyText: LocaleKeys.from,
                    style: TextStyles.lightGrey12,
                  ),
                  SFText(
                    keyText: LocaleKeys.to,
                    style: TextStyles.lightGrey12,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SFText(
                    keyText: LocaleKeys.spending,
                    style: TextStyles.bold16LightWhite,
                  ),
                  SFText(
                    keyText: LocaleKeys.wallet,
                    style: TextStyles.bold16LightWhite,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            SFText(
              keyText: LocaleKeys.fee,
              style: TextStyles.lightGrey12,
            ),
            const SizedBox(width: 4),
            const Spacer(),
            const SFIcon(Ics.icSlft),
            const SizedBox(width: 8),
            SFText(
              keyText: '30 SLFT',
              textAlign: TextAlign.right,
              style: TextStyles.white12,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SFText(
              keyText: LocaleKeys.you_will_transfer,
              style: TextStyles.lightGrey12,
            ),
            const SizedBox(width: 4),
            const Spacer(),
            const SFIcon(Ics.icNft),
            const SizedBox(width: 8),
            SFText(
              keyText: '  0 NFT',
              textAlign: TextAlign.right,
              style: TextStyles.white12,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: SFButton(
                text: LocaleKeys.cancel,
                onPressed: () {
                  Navigator.pop(context);
                },
                textStyle: TextStyles.lightGrey16,
                color: AppColors.light4,
                width: double.infinity,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SFButton(
                text: LocaleKeys.confirm,
                onPressed: () {
                  Navigator.pop(context);
                },
                width: double.infinity,
                textStyle: TextStyles.white16,
                gradient: AppColors.gradientBlueButton,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
