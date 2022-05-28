import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PopUpConfirmTransfer extends StatelessWidget {
  const PopUpConfirmTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SFAlertDialog(
      padding: const EdgeInsets.all(20.0),
      children: [
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: const Icon(
                  Icons.close,
                  color: AppColors.lightGrey,
                ))),
        SFText(
          keyText: Keys.confirmTransfer,
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
                      keyText: Keys.wallet,
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
                      keyText: Keys.spending,
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
              keyText: Keys.fee,
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
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SFText(
              keyText: Keys.youWillTransfer,
              style: TextStyles.lightGrey14,
            ),
            Expanded(
                child: SFText(
              keyText: "0.007930727 AVAX",
              style: TextStyles.lightWhite16,
              textAlign: TextAlign.end,
            )),
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
