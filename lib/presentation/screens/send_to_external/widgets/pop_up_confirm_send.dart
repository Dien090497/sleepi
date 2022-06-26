import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_cubit.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';

class PopUpConfirmSend extends StatelessWidget {
  const PopUpConfirmSend({required this.toAddress, required this.valueInEther, required this.fee, Key? key}) : super(key: key);

  final String toAddress;
  final double valueInEther;
  final double fee;
  @override
  Widget build(BuildContext context) {
    String tokenFrom = Const.tokens[0]["address"].toString();
    return BlocProvider(
      create: (context) => SendToExternalCubit()..estimateGas(),
      child: BlocConsumer<SendToExternalCubit, SendToExternalState>(
        listener: (context, state) { },
        builder: (context, state) {
          final cubit = context.read<SendToExternalCubit>();
          cubit.toAddress = toAddress;
          cubit.valueInEther = valueInEther;
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
                            keyText: "$fee AVAX",
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
                          keyText: "$valueInEther AVAX",
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
                          keyText: toAddress,
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
                        onPressed: () {
                          cubit.sendToExternal();
                          Navigator.pop(context);
                          showSuccessfulDialog(context);
                          cubit.getBalanceToken(tokenFrom);
                        },
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
