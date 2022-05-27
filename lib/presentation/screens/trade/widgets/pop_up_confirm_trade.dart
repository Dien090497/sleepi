import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PopUpConfirmTrade extends StatelessWidget {
  const PopUpConfirmTrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: Keys.confirmTrade,
          style: TextStyles.bold18LightWhite,
        ),
        const SizedBox(
          height: 24,
        ),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SFText(
                      keyText: Keys.from,
                      style: TextStyles.lightGrey12,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SFText(
                      keyText: "0.00",
                      style: TextStyles.bold18White,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SFText(
                      keyText: Keys.to,
                      style: TextStyles.lightGrey12,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SFText(
                      keyText: Keys.avax,
                      toUpperCase: true,
                      style: TextStyles.bold18White,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SFText(
              keyText: Keys.received,
              style: TextStyles.lightGrey14,
            ),
            Expanded(
                child: SFText(
                    keyText: "0.000005 AVAX",
                    style: TextStyles.lightWhite16,
                    textAlign: TextAlign.end)),
          ],
        ),
        const SizedBox(
          height: 32.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SFButton(
                text: Keys.cancel,
                textStyle: TextStyles.w600LightGreySize16,
                color: AppColors.light4,
                onPressed: () => Navigator.maybePop(context),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: SFButton(
                text: Keys.confirm,
                textStyle: TextStyles.bold14LightWhite,
                color: AppColors.blue,
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
