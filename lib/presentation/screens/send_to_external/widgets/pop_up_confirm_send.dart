import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_cubit.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';

class PopUpConfirmSend extends StatefulWidget {
  const PopUpConfirmSend({required this.toAddress, required this.valueInEther, Key? key}) : super(key: key);

  final String toAddress;
  final double valueInEther;

  @override
  State<PopUpConfirmSend> createState() => _PopUpConfirmSendState();
}

class _PopUpConfirmSendState extends State<PopUpConfirmSend> {
  double? fee;
  bool isDisabled = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendToExternalCubit()..init(),
      child: BlocConsumer<SendToExternalCubit, SendToExternalState>(
        listener: (context, state) {
          if(state is sendToExternalSuccess){
            Navigator.pop(context);
            Navigator.pop(context);
            showSuccessfulDialog(context);
          }
          if (state is SendToExternalCalculatorFee) {
            fee = ((state.fee * 50000000000) / pow(10, 18));
            if(fee == null) {
              setState((){
                isDisabled = true;
              });
            }else {
              setState((){
                isDisabled = false;
              });
            }
          }
        },
        builder: (context, state) {
          final cubit = context.read<SendToExternalCubit>();
          if (state is sendToExternalStateInitial) {
            cubit.estimateGas(widget.toAddress, widget.valueInEther);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SFText(
                  keyText: LocaleKeys.send,
                  style: TextStyles.bold18LightWhite,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SFText(
                      keyText: LocaleKeys.fee,
                      style: TextStyles.lightGrey14,
                    ),
                    Expanded(
                        child: SFText(
                            keyText: "${fee ?? "---"} AVAX",
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
                    SFText(
                      keyText: LocaleKeys.you_will_send,
                      style: TextStyles.lightGrey14,
                    ),
                    Expanded(
                        child: SFText(
                          keyText: "${widget.valueInEther} AVAX",
                          style: TextStyles.lightWhite16,
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SFText(
                        keyText: LocaleKeys.send_address,
                        style: TextStyles.lightGrey14,
                      ),
                    ),
                    Expanded(
                        child: SFText(
                          keyText: widget.toAddress,
                          style: TextStyles.lightWhite16,
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 44.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        color: AppColors.blue,
                        width: double.infinity,
                        disabled: isDisabled,
                        onPressed: () => cubit.sendToExternal(widget.toAddress, widget.valueInEther),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
