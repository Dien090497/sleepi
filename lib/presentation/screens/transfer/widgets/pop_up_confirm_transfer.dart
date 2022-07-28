import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpConfirmTransfer extends StatelessWidget {
  const PopUpConfirmTransfer({
    Key? key,
    required this.amount,
    required this.fee,
    required this.symbol,
    required this.tokenAddress,
    required this.isToSpending,
    required this.onConfirm,
    required this.isLoadingNotifier,
  }) : super(key: key);

  final double amount;
  final double fee;
  final String symbol;
  final String tokenAddress;
  final bool isToSpending;
  final VoidCallback onConfirm;
  final ValueNotifier<bool> isLoadingNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SFText(
            keyText: LocaleKeys.confirm_transfer,
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
                      const SizedBox(height: 12.0),
                      SFText(
                        keyText: isToSpending
                            ? LocaleKeys.spending
                            : LocaleKeys.wallet,
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
                      const SizedBox(height: 12.0),
                      SFText(
                        keyText: isToSpending
                            ? LocaleKeys.wallet
                            : LocaleKeys.spending,
                        style: TextStyles.bold18White,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.fee,
                style: TextStyles.lightGrey14,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: SFText(
                      keyText: "$fee AVAX",
                      style: TextStyles.lightWhite16,
                      textAlign: TextAlign.end),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.you_will_transfer,
                style: TextStyles.lightGrey14,
              ),
              Expanded(
                  child: SFText(
                keyText: "${amount.formatBalanceToken} ${symbol.toUpperCase()}",
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.end,
              )),
            ],
          ),
          const SizedBox(height: 32.0),
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
              const SizedBox(width: 16.0),
              Expanded(
                child: ValueListenableBuilder<bool>(
                    valueListenable: isLoadingNotifier,
                    child: SFButton(
                      text: LocaleKeys.confirm,
                      textStyle: TextStyles.bold14LightWhite,
                      width: double.infinity,
                      gradient: AppColors.gradientBlueButton,
                      onPressed: onConfirm,
                    ),
                    builder: (context, isLoading, child) {
                      return isLoading ? const LoadingIcon() : child!;
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
