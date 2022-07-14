import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpConfirmApprove extends StatelessWidget {
  const PopUpConfirmApprove({
    Key? key,
    required this.tokenName,
    required this.onConfirm,
  }) : super(key: key);

  final VoidCallback onConfirm;
  final String tokenName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SFText(
            keyText: LocaleKeys.confirm_approve,
            style: TextStyles.bold18LightWhite,
          ),
          const SizedBox(height: 24),
          SFCard(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
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
                        keyText: LocaleKeys.wallet,
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
                        keyText: LocaleKeys.spending,
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
                keyText: LocaleKeys.approve,
                style: TextStyles.lightGrey14,
              ),
              Expanded(
                  child: SFText(
                      keyText: tokenName.toUpperCase(),
                      style: TextStyles.lightWhite16,
                      textAlign: TextAlign.end)),
            ],
          ),
          const SizedBox(
            height: 32.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SFButton(
                  text: LocaleKeys.cancel,
                  textStyle: TextStyles.w600LightGreySize16,
                  color: AppColors.light4,
                  width: double.infinity,
                  onPressed: () => Navigator.maybePop(context),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: SFButton(
                  text: LocaleKeys.confirm,
                  textStyle: TextStyles.bold14LightWhite,
                  width: double.infinity,
                  gradient: AppColors.gradientBlueButton,
                  onPressed: () {
                    onConfirm();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
