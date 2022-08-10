import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
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
  final refreshController = RefreshController();

  @override
  void dispose() {
    isLoadingNotifier.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spendingState = context.watch<UserBloc>().state;
    final walletState = context.watch<WalletCubit>().state;

    if (spendingState is UserLoaded && walletState is WalletStateLoaded) {
      final transferCubit = context.watch<TransferCubit>();
      final transferState = transferCubit.state;
      final spendingTokens = spendingState.listTokens;
      final walletTokens = walletState.tokenList;
      if (transferState is TransferInitial) {
        transferCubit.init(
          baseSpendingTokens: spendingTokens,
          baseWalletTokens: walletTokens,
          userId: spendingState.userInfoEntity.id,
          ownerAddress: walletState.walletInfoEntity.address,
        );
      } else if (transferState is TransferLoaded) {
        transferCubit.refresh(
            baseSpendingTokens: spendingTokens, baseWalletTokens: walletTokens);
      }
    }

    return BlocConsumer<TransferCubit, TransferState>(
      listener: (context, state) async {
        if (state is TransferLoaded) {
          if (state.errorMsg?.isNotEmpty ?? false) {
            context.read<WalletCubit>().refresh();
            context.read<UserBloc>().add(const RefreshBalanceToken());
          }
          if (state.amount == null) {
            valueController.clear();
          }
          final cubit = context.read<TransferCubit>();
          final isAllowance = state.isAllowance;
          if (isAllowance == false) {
            showCustomAlertDialog(
              context,
              showClosed: false,
              children: PopUpConfirmApprove(
                onConfirm: () {
                  isLoadingNotifier.value = true;
                  cubit.approve().then((str) {
                    Navigator.pop(context);
                    if (str.isNotEmpty) {
                      showApproveSuccessfulDialog(context, txHash: str);
                    } else {
                      showMessageDialog(
                          context, LocaleKeys.not_enough_to_pay_the_fee.tr());
                    }
                    isLoadingNotifier.value = false;
                  });
                },
                tokenName: state.currentToken.symbol.toUpperCase(),
                isLoadingNotifier: isLoadingNotifier,
                fee: state.fee,
              ),
            );
          } else if (isAllowance == true) {
            final userState = context.read<UserBloc>().state;
            final walletState = context.read<WalletCubit>().state;
            if (userState is UserLoaded) {
              showCustomAlertDialog(
                context,
                showClosed: false,
                barrierDismissible: false,
                children: PopUpConfirmTransfer(
                  onConfirm: () {
                    isLoadingNotifier.value = true;
                    cubit
                        .transfer(userId: userState.userInfoEntity.id)
                        .then((_) {
                      Navigator.pop(context);
                      isLoadingNotifier.value = false;
                    });
                  },
                  isToSpending: state.isToSpending,
                  amount: state.amount!,
                  fee: state.fee,
                  symbol: state.currentToken.symbol,
                  tokenAddress: state.currentToken.address,
                  isLoadingNotifier: isLoadingNotifier,
                  ownerAddress: (walletState as WalletStateLoaded)
                      .walletInfoEntity
                      .address,
                  userId: userState.userInfoEntity.id,
                ),
              );
            }
          }
        }
        if (state is TransferSuccess) {
          showApproveSuccessfulDialog(
            context,
            txHash: state.txHash ?? '',
            barrierDismissible: false,
            onBackPress: () {
              Navigator.popUntil(
                  context,
                  (r) =>
                      r.settings.name == R.wallet ||
                      r.settings.name == R.bottomNavigation);
            },
          );
          isLoadingNotifier.value = false;
        }
        if (state is TransferFailed) {
          showMessageDialog(context, state.msg);
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
                  child: SmartRefresher(
                    controller: refreshController,
                    onRefresh: () {
                      context.read<WalletCubit>().refresh();
                      context.read<UserBloc>().add(const RefreshBalanceToken());
                      Future.delayed(const Duration(seconds: 1), () {
                        refreshController.refreshCompleted();
                      });
                    },
                    child: ListView(
                      children: [
                        SFText(
                          keyText: LocaleKeys.asset,
                          style: TextStyles.lightGrey14,
                        ),
                        const SizedBox(height: 4.0),
                        const AssetTile(),
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
                            cubit.setAmount(v);
                          },
                          onPressed: () {
                            context.read<WalletCubit>().refresh();
                            context
                                .read<UserBloc>()
                                .add(const RefreshBalanceToken());
                            final isAvax =
                                state.currentToken.symbol.toLowerCase() ==
                                    'avax';
                            final amount = isAvax
                                ? (Decimal.parse('${currentToken.balance}') -
                                        Decimal.parse(state.fee ?? '0'))
                                    .floor(scale: 6)
                                : Decimal.parse('${currentToken.balance}')
                                    .floor(scale: 6);
                            if (amount >= Decimal.zero) {
                              valueController.text = amount.toString();
                            } else {
                              valueController.text = '0';
                            }
                            cubit.setAmount(amount.toString());
                          },
                        ),
                        if (state.errorMsg != null)
                          SFText(
                            keyText: state.errorMsg!,
                            style: TextStyles.red14,
                          ),
                        // const SizedBox(height: 8.0),
                        // Text(
                        //   'Fee: ${state.fee ?? '----'} AVAX',
                        //   style: TextStyles.lightGrey14,
                        // ),
                        const SizedBox(height: 8.0),
                        SFText(
                          keyText:
                              "${LocaleKeys.available.tr()} : ${currentToken.balance.formatCurrency} ${currentToken.name.toUpperCase()}",
                          style: TextStyles.lightGrey14,
                        ),
                        const SizedBox(height: 32.0),
                      ],
                    ),
                  ),
                ),
                SFButton(
                  text: LocaleKeys.confirm_transfer,
                  textStyle: TextStyles.w600WhiteSize16,
                  width: double.infinity,
                  gradient: AppColors.gradientBlueButton,
                  disabled: state.fee == null && state.errorMsg != null,
                  onPressed: () {
                    cubit.checkAllowance(valueStr: valueController.text);
                  },
                ),
              ],
            ),
          );
        }
        if (state is TransferFailed) {
          return ErrorWidget(state.msg);
        }
        return const LoadingIcon();
      },
    );
  }
}
