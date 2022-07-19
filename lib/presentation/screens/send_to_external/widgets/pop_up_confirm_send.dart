import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_cubit.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';
import 'package:slee_fi/usecase/estimate_token_function_fee_usecase.dart';

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
  String ownerAddress = '';
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
        },
        builder: (context, state) {
          final cubit = context.read<SendToExternalCubit>();
          final walletCubit = context.read<WalletCubit>();
          final walletState = walletCubit.state;

          if (walletState is WalletStateLoaded) {
            ownerAddress = walletState.walletInfoEntity.address;
          }

          if (state is sendToExternalStateInitial) {
            walletCubit.getWallet();
          }
          return Padding(
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
                              child: FutureBuilder<dartz.Either<Failure, double>>(
                                future: getIt<EstimateTokenFunctionFeeUseCase>()
                                    .call(EstimateGasTokenParams(
                                  ownerAddress: ownerAddress,
                                  toAddress: widget.toAddress,
                                  value: widget.valueInEther,
                                )),
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.hasData
                                        ? '${snapshot.data!.getOrElse(() => 0)} ${widget.transferToken ? widget.arg?.symbol : 'AVAX'}'
                                        : '--.--',
                                    textAlign: TextAlign.right,
                                    style: TextStyles.lightWhite16,
                                  );
                                },
                              ),
                          ),
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
                                onPressed: () {
                                  if (widget.transferToken) {
                                    cubit.sendTokenExternal(widget.toAddress,
                                        widget.valueInEther, widget.arg);
                                  } else {
                                    cubit.sendToExternal(widget.toAddress,
                                        widget.valueInEther, "AVAX");
                                  }
                                }),
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
