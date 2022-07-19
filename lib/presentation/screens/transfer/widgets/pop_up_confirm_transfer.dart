import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/contract_addresses/contract_addresses.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_cubit.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_state.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';

class PopUpConfirmTransfer extends StatelessWidget {
  const PopUpConfirmTransfer({
    Key? key,
    required this.cubit,
    required this.amount,
    required this.symbol,
    required this.tokenAddress,
    required this.spendingToWallet,
    required this.onConfirm,
    required this.isLoadingNotifier,
  }) : super(key: key);

  final TransferCubit cubit;
  final double amount;
  final String symbol;
  final String tokenAddress;
  final bool spendingToWallet;
  final VoidCallback onConfirm;
  final ValueNotifier<bool> isLoadingNotifier;

  @override
  Widget build(BuildContext context) {
    final transferState = cubit.state;
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
                        keyText: spendingToWallet
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
                        keyText: spendingToWallet
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
          if (transferState is TransferLoaded)
            FutureBuilder<Either>(
                future: transferState.isToSpending
                    ? getIt<SendToExternalUseCase>().calculatorFee(
                        SendToExternalParams(
                            contractAddressTo: ContractAddresses.spending.hex,
                            valueInEther: amount, tokenSymbol: symbol))
                    : getIt<EstimateGasWithdrawUseCase>().call(
                        EstimateGasWithdrawParam(
                            type: symbol, contractAddress: tokenAddress)),
                builder: (context, snapshot) {
                  return Row(
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
                              keyText:
                                  "${snapshot.data?.getOrElse(() => '') ?? '--'} AVAX",
                              style: TextStyles.lightWhite16,
                              textAlign: TextAlign.end),
                        ),
                      ),
                    ],
                  );
                }),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.you_will_transfer,
                style: TextStyles.lightGrey14,
              ),
              Expanded(
                  child: SFText(
                keyText: "$amount ${symbol.toUpperCase()}",
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
