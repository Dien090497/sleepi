import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopupGachaConfirm extends StatelessWidget {
  const PopupGachaConfirm({Key? key, required this.onConfirmTap, required this.priceSpin, required this.quantity}) : super(key: key);

  final int priceSpin;
  final int quantity;
  final VoidCallback? onConfirmTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.confirm,
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 24),
        SFText(
          keyText: LocaleKeys.consume_and_turn_gacha_time.tr(namedArgs: {
            'price': '$priceSpin',
            'quantity': '$quantity',
            }),
          style: TextStyles.w400lightGrey14,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
                child: SFButton(
                  text: LocaleKeys.cancel,
                  onPressed: () => Navigator.pop(context),
                  textStyle: TextStyles.lightGrey16,
                  color: AppColors.whiteOpacity5,
                  width: double.infinity,
                )),
            const SizedBox(width: 12),
            Expanded(
                child: SFButton(
                  text: LocaleKeys.confirm,
                  onPressed: onConfirmTap,
                  textStyle: TextStyles.white16,
                  gradient: AppColors.gradientGacha,
                  width: double.infinity,
                )),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
