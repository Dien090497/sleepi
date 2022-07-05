import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_spending.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_spending_state.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/asset_tile.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/pop_up_approve.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/pop_up_confirm_transfer.dart';

class TransferList extends StatefulWidget {
  const TransferList({Key? key, this.tokenEntity}) : super(key: key);
  final TokenEntity? tokenEntity;

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransferSpendingCubit(),
      child: BlocConsumer<TransferSpendingCubit, TransferSpendingState>(
        listener: (context, state) {
          if (state is TransferSpendingStateLoaded) {
            final cubit = context.read<TransferSpendingCubit>();
            if (state.fee != null) {
              showCustomAlertDialog(
                context,
                showClosed: false,
                children: PopUpConfirmTransfer(
                  fee: state.fee ?? 0.0025,
                  cubit: cubit,
                  amount: double.parse(controller.text),
                  tokenName: widget.tokenEntity?.symbol ?? '',
                  contractAddress: widget.tokenEntity?.address ?? '',
                ),
              );
            }
            if (state.transferSpendingEntity != null) {
              if (state.transferSpendingEntity?.type ==
                  TokenToSpending.approve) {
                showCustomAlertDialog(
                  context,
                  showClosed: false,
                  children: PopUpConfirmApprove(
                    cubit: cubit,
                    tokenName: widget.tokenEntity?.symbol ?? '',
                    contractAddress: widget.tokenEntity?.address ?? '',
                  ),
                );
              }
              if (state.transferSpendingEntity?.type ==
                  TokenToSpending.spending) {
                showSuccessfulDialog(context, LocaleKeys.successfull);
              }
            }
          }
        },
        builder: (context, state) {
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
                        tokenName: widget.tokenEntity?.name.toUpperCase() ?? '',
                        img: widget.tokenEntity?.icon ?? '',
                      ),
                      const SizedBox(height: 24.0),
                      SFTextFieldTextButton(
                        labelText: LocaleKeys.amount,
                        textButton: LocaleKeys.all,
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d{1,}\.?\d{0,6}')),
                        ],
                        controller: controller,
                      ),
                      if (state is TransferSpendingStateError)
                        SFText(
                          keyText: state.message,
                          style: TextStyles.red14,
                        ),
                      const SizedBox(height: 8.0),
                      SFText(
                        keyText:
                            "${LocaleKeys.available.tr()} : ${widget.tokenEntity?.balance.formatBalanceToken} ${widget.tokenEntity?.name.toUpperCase()}",
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
                    final cubit = context.read<TransferSpendingCubit>();
                    cubit.estimateGas(widget.tokenEntity?.address ?? '',
                        amount: controller.text,
                        balance: widget.tokenEntity?.balance ?? 0);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
