import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_cubit.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';

class PopUpConfirmSend extends StatefulWidget {
  const PopUpConfirmSend({
    required this.toAddress,
    required this.valueInEther,
    this.transferToken = false,
    this.arg,
    Key? key,
  }) : super(key: key);

  final String toAddress;
  final double valueInEther;
  final bool transferToken;
  final SendToExternalArguments? arg;

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
          if (state is sendToExternalSuccess) {
            showSuccessfulDialog(context, null, onBackPress: () {
              Navigator.popUntil(context, (r) {
                return r.settings.name == R.wallet;
              });
            });
          }
          if (state is SendToExternalCalculatorFee) {
            fee = state.fee;
            if (state.fee == null) {
              setState(() {
                isDisabled = true;
              });
            } else {
              setState(() {
                isDisabled = false;
              });
            }
          }
        },
        builder: (context, state) {
          final cubit = context.read<SendToExternalCubit>();
          if (state is sendToExternalStateInitial) {
            if (widget.transferToken) {
              cubit.estimateGas(widget.toAddress);
            } else {
              cubit.estimateGas(widget.toAddress,
                  valueInEther: widget.valueInEther);
            }
          }
          return isDisabled == false
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SFText(
                        keyText: LocaleKeys.send,
                        style: TextStyles.bold18LightWhite,
                      ),
                      const SizedBox(height: 32),
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
                            keyText:
                                "${widget.valueInEther} ${widget.transferToken ? widget.arg?.symbol : 'AVAX'}",
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
                                onPressed: () {
                                  if (widget.transferToken) {
                                    cubit.sendTokenExternal(widget.toAddress,
                                        widget.valueInEther, widget.arg);
                                  } else {
                                    cubit.sendToExternal(widget.toAddress,
                                        widget.valueInEther, fee!);
                                  }
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: SizedBox(
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
        },
      ),
    );
  }
}
