import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_chip.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class PopUpCalculator extends StatelessWidget {
  const PopUpCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SFAlertDialog(
      padding: const EdgeInsets.all(20.0),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: const Icon(
                  Icons.close,
                  color: AppColors.lightGrey,
                ))),
        Center(
            child: SFText(
          keyText: Keys.roiCalculator,
          style: TextStyles.bold18LightWhite,
        )),
        const SizedBox(
          height: 24,
        ),
        SFText(
          keyText: Keys.flexible,
          style: TextStyles.bold16Blue,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 12.0,
        ),
        SFText(
          keyText: Keys.sleefiStacked,
          style: TextStyles.lightGrey14,
        ),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SFText(
                      keyText: "0.00 USD",
                      style: TextStyles.lightWhite16,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SFText(
                      keyText: "0.00 SLFT",
                      style: TextStyles.lightGrey12,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.swap_vert,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: const [
                  SFChip(
                    text: "100",
                    textStyle: TextStyles.w700LightGreySize14,
                  ),
                  SFChip(
                    text: "10000",
                    textStyle: TextStyles.w700LightGreySize14,
                  ),
                  SFChip(
                    text: "My Balance",
                    textStyle: TextStyles.w700LightGreySize14,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child:
                  SFIcon(Ics.icQuestion, color: AppColors.lightGrey, width: 24),
            ),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        SFText(
          keyText: Keys.addDuration,
          style: TextStyles.lightGrey14,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: const [
            SFChip(
              text: "1D",
              textStyle: TextStyles.w700WhiteSize14,
              color: AppColors.blue,
            ),
            SFChip(
              text: "3D",
              textStyle: TextStyles.w700LightGreySize14,
            ),
            SFChip(
              text: "7D",
              textStyle: TextStyles.w700LightGreySize14,
            ),
            SFChip(
              text: "30D",
              textStyle: TextStyles.w700LightGreySize14,
            ),
            SFChip(
              text: "60D",
              textStyle: TextStyles.w700LightGreySize14,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const SFTextFieldTextButton(
          showLabel: false,
          textButton: Keys.day,
          textButtonStyle: TextStyles.lightGrey14,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          margin: const EdgeInsets.only(top: 12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColors.lightDark),
              gradient: AppColors.gradientROI),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SFText(
                    keyText: Keys.roiCurrentRates,
                    style: TextStyles.blue14,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SFText(
                    keyText: "0.00",
                    style: TextStyles.bold24LightWhite,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SFText(
                    keyText: "~ 0 SLFT (0.00%)",
                    style: TextStyles.lightGrey14,
                  ),
                ],
              )),
              const SFIcon(
                Ics.icEdit,
                width: 28,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
