import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_cubit.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/asset_tile.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/pop_up_approve.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/pop_up_confirm_transfer.dart';

class TransferList extends StatefulWidget {
  const TransferList({Key? key}) : super(key: key);

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);
  final valueController = TextEditingController();

  @override
  void dispose() {
    isLoadingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferCubit, TransferState>(
      listener: (context, state) {
        if (state is TransferLoaded) {
          isLoadingNotifier.value = state.isLoading;
          final cubit = context.read<TransferCubit>();
          final isAllowance = state.isAllowance;
          if (isAllowance == false) {
            showCustomAlertDialog(
              context,
              showClosed: false,
              children: PopUpConfirmApprove(
                onConfirm: () {
                  cubit.approve().then((str) {
                    Navigator.pop(context);
                    if (str == 'done') {
                      showSuccessfulDialog(context, LocaleKeys.successfull);
                    } else if (str.isNotEmpty) {
                      showMessageDialog(context, str);
                    }
                  });
                },
                tokenName: state.currentToken.symbol.toUpperCase(),
                isLoadingNotifier: isLoadingNotifier,
              ),
            );
          } else if (isAllowance == true) {
            final userState = context.read<UserBloc>().state;

            if (userState is UserLoaded) {
              showCustomAlertDialog(
                context,
                showClosed: false,
                children: PopUpConfirmTransfer(
                  onConfirm: () {
                    cubit
                        .transfer(userId: userState.userInfoEntity.id)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  },
                  isToSpending: state.isToSpending,
                  amount: state.amount!,
                  fee: state.fee!,
                  symbol: state.currentToken.symbol,
                  tokenAddress: state.currentToken.address,
                  isLoadingNotifier: isLoadingNotifier,
                ),
              );
            }
          }
        }
        if (state is TransferSuccess) {
          isLoadingNotifier.value = false;
          showSuccessfulDialog(
            context,
            null,
            barrierDismissible: false,
            onBackPress: () {
              isLoadingNotifier.value = false;
              Navigator.popUntil(context, (r) => r.settings.name == R.wallet);
            },
          );
        }
      },
      buildWhen: (prev, cur) => cur is TransferLoaded,
      builder: (context, state) {
        final cubit = context.read<TransferCubit>();

        if (state is TransferLoaded) {
          final currentToken = state.currentToken;

          return Container(
            decoration: const BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SFText(
                        keyText: LocaleKeys.asset,
                        style: TextStyles.lightGrey14,
                      ),
                      const SizedBox(height: 4.0),
                      AssetTile(
                        tokenName: currentToken.name.toUpperCase(),
                        img: currentToken.icon,
                      ),
                      const SizedBox(height: 24.0),
                      SFTextFieldTextButton(
                        controller: valueController,
                        labelText: LocaleKeys.amount,
                        textButton: LocaleKeys.all,
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d{1,}[.,]?\d{0,6}')),
                        ],
                        valueChanged: (v) {
                          cubit.enterAmount(v);
                        },
                        onPressed: () {
                          if (state.currentToken.symbol.toLowerCase() ==
                              'avax') {
                            if (state.fee != null) {
                              valueController.text =
                                  (Decimal.parse('${currentToken.balance}') -
                                          Decimal.parse('${state.fee}'))
                                      .toString();
                            }
                          } else {
                            valueController.text = '${currentToken.balance}';
                          }
                        },
                      ),
                      if (state.errorMsg != null)
                        SFText(
                          keyText: state.errorMsg!,
                          style: TextStyles.red14,
                        ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${state.fee ?? ''}',
                        style: TextStyles.lightGrey14,
                      ),
                      const SizedBox(height: 8.0),
                      SFText(
                        keyText:
                            "${LocaleKeys.available.tr()} : ${currentToken.balance.formatBalanceToken} ${currentToken.name.toUpperCase()}",
                        style: TextStyles.lightGrey14,
                      ),
                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
                SFButton(
                  text: LocaleKeys.confirm_transfer,
                  textStyle: TextStyles.w600WhiteSize16,
                  width: double.infinity,
                  gradient: AppColors.gradientBlueButton,
                  disabled: state.fee == null && state.errorMsg != null,
                  onPressed: () {
                    final walletState = context.read<WalletCubit>().state;
                    if (walletState is WalletStateLoaded) {
                      if (state.isToSpending) {
                        cubit.checkAllowance(
                          ownerAddress: walletState.walletInfoEntity.address,
                        );
                      } else {
                        //
                      }
                    }
                  },
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
