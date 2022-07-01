import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpConfirmTrade extends StatelessWidget {
  const PopUpConfirmTrade({
    Key? key,
    required this.value,
    required this.symbolFrom,
    required this.symbolTo,
    required this.addressFrom,
    required this.addressTo,
    required this.onSwap, required this.amountOutMin,
  }) : super(key: key);

  final double value;
  final String symbolFrom;
  final String addressFrom;
  final String symbolTo;
  final String addressTo;
  final VoidCallback onSwap;
  final double amountOutMin;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                SFText(
                  keyText: LocaleKeys.confirm_trade,
                  style: TextStyles.bold18LightWhite,
                ),
                const SizedBox(
                  height: 24,
                ),
                SFCard(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SFText(
                              keyText: LocaleKeys.from,
                              style: TextStyles.lightGrey12,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SFText(
                              keyText: "$value $symbolFrom",
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
                              keyText: LocaleKeys.to,
                              style: TextStyles.lightGrey12,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SFText(
                              keyText: symbolTo,
                              stringCase: StringCase.upperCase,
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
                      keyText: LocaleKeys.received,
                      style: TextStyles.lightGrey14,
                    ),
                    Expanded(
                        child: SFText(
                            keyText:
                                "${amountOutMin.toStringAsFixed(6)} $symbolTo",
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
                        text: LocaleKeys.cancel,
                        textStyle: TextStyles.w600LightGreySize16,
                        width: double.infinity,
                        color: AppColors.light4,
                        onPressed: () => Navigator.maybePop(context),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: SFButton(
                        text: LocaleKeys.confirm,
                        width: double.infinity,
                        textStyle: TextStyles.bold14LightWhite,
                        gradient: AppColors.gradientBlueButton,
                        onPressed: onSwap,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
