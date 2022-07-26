import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
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
  const TransferList({
    Key? key,
    required this.tokenEntity,
    required this.spendingToWallet,
    required this.transferType,
  }) : super(key: key);

  final TokenEntity tokenEntity;
  final bool spendingToWallet;
  final TransferType transferType;

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  final TextEditingController controller = TextEditingController();
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

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
          final cubit = context.read<TransferCubit>();
          if (state.needApprove ?? false) {
            showCustomAlertDialog(
              context,
              showClosed: false,
              children: PopUpConfirmApprove(
                onConfirm: () {
                  isLoadingNotifier.value = true;
                  cubit
                      .approve(addressContract: widget.tokenEntity.address)
                      .then((str) {
                    isLoadingNotifier.value = false;
                    Navigator.pop(context);
                    if (str == 'done') {
                      showSuccessfulDialog(context, LocaleKeys.successfull);
                    } else {
                      showMessageDialog(context, str);
                    }
                  });
                },
                tokenName: widget.tokenEntity.symbol.toUpperCase(),
                isLoadingNotifier: isLoadingNotifier,
              ),
            );
          } else if (!(state.needApprove ?? true)) {
            final amount = double.parse(controller.text.replaceAll(',', '.'));
            final userState = context.read<UserBloc>().state;

            showCustomAlertDialog(
              context,
              showClosed: false,
              children: PopUpConfirmTransfer(
                onConfirm: () {
                  isLoadingNotifier.value = true;
                  cubit.transfer(
                    amount: amount,
                    contractAddress: widget.tokenEntity.address,
                    userId: (userState as UserLoaded).userInfoEntity.id,
                    symbol: widget.tokenEntity.symbol,
                    balance: widget.tokenEntity.balance,
                  );
                },
                spendingToWallet: widget.spendingToWallet,
                cubit: cubit,
                amount: amount,
                symbol: widget.tokenEntity.symbol,
                tokenAddress: widget.tokenEntity.address,
                isLoadingNotifier: isLoadingNotifier,
              ),
            );
          } else {
            isLoadingNotifier.value = false;
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
      builder: (context, state) {
        final cubit = context.read<TransferCubit>();

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
                      tokenName: widget.tokenEntity.name.toUpperCase(),
                      img: widget.tokenEntity.icon,
                    ),
                    const SizedBox(height: 24.0),
                    SFTextFieldTextButton(
                      labelText: LocaleKeys.amount,
                      textButton: LocaleKeys.all,
                      textInputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d{1,}[.,]?\d{0,6}')),
                      ],
                      controller: controller,
                      valueChanged: (v) {
                        cubit.removeError();
                      },
                      onPressed: () {
                        controller.text =
                            widget.tokenEntity.balance.formatBalanceToken;
                      },
                    ),
                    if (state is TransferLoaded && state.errorMsg != null)
                      SFText(
                        keyText: state.errorMsg!,
                        style: TextStyles.red14,
                      ),
                    const SizedBox(height: 8.0),
                    SFText(
                      keyText:
                          "${LocaleKeys.available.tr()} : ${widget.tokenEntity.balance.formatBalanceToken} ${widget.tokenEntity.name.toUpperCase()}",
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
                onPressed: () {
                  final walletState = context.read<WalletCubit>().state;
                  if (walletState is WalletStateLoaded) {
                    cubit.checkAllowance(
                      amountStr: controller.text,
                      contractAddress: widget.tokenEntity.address,
                      ownerAddress: walletState.walletInfoEntity.address,
                      balance: widget.tokenEntity.balance,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
