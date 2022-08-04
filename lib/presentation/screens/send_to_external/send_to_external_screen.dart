import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_cubit.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/address_scan.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/pop_up_confirm_send.dart';
import 'package:slee_fi/resources/resources.dart';

class SendToExternalArguments {
  final String symbol;
  final String icon;
  final TokenEntity? tokenEntity;

  SendToExternalArguments(
      {required this.symbol, required this.icon, this.tokenEntity});
}

class SendToExternalScreen extends StatefulWidget {
  const SendToExternalScreen({Key? key}) : super(key: key);

  @override
  State<SendToExternalScreen> createState() => _SendToExternalScreenState();
}

class _SendToExternalScreenState extends State<SendToExternalScreen> {
  late double balance = 0;
  double fee = 0;
  String contractAddressTo = '';
  String ownerAddress = '';
  double valueInEther = 0;

  TextEditingController controllerAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as SendToExternalArguments?;

    return BlocProvider(
      create: (context) => SendToExternalCubit()..init(),
      child: BlocConsumer<SendToExternalCubit, SendToExternalState>(
        listener: (context, state) {
          if (state is GetTokenBalanceSuccess) {
            balance = state.balance;
            fee = state.fee;
            setState(() {});
          }
          if (state is SendToExternalCheckedValidator) {
            showCustomAlertDialog(context,
                children: PopUpConfirmSend(
                  toAddress: contractAddressTo,
                  valueInEther:
                  double.parse(controllerAmount.text.replaceAll(',', '.')),
                  transferToken: args != null ? true : false,
                  arg: args,
                  fee: state.fee,
                ));
          }
        },
        builder: (context, state) {
          final cubit = context.read<SendToExternalCubit>();
          if (state is sendToExternalStateInitial) {
            cubit.getTokenBalance();
          }

          return DismissKeyboardWidget(
            child: BackgroundWidget(
              appBar: SFAppBar(
                title: LocaleKeys.send_to.tr().reCase(StringCase.titleCase),
                textStyle: TextStyles.bold18White,
                context: context,
              ),
              resizeToAvoidBottomInset: false,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            args != null
                                ? SFIcon(
                              args.icon,
                              width: 60,
                              height: 60,
                            )
                                : Image.asset(Imgs.sendToExternal),
                            SizedBox(
                              height: args != null ? 32 : 0,
                            ),
                            SFCard(
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AddressScan(
                                    /*errorText:
                                        state is SendToExternalErrorToAddress
                                            ? state.msg
                                            : null,*/
                                    onChangedAddress: (address) {
                                      contractAddressTo = address;
                                      cubit.init();
                                    },
                                  ),
                                  if (state is SendToExternalErrorToAddress)
                                    SFText(
                                      keyText: state.msg,
                                      style: TextStyles.w400Red12,
                                    ),
                                  const SizedBox(height: 24),
                                  SFTextField(
                                    labelText: LocaleKeys.amount,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^\d{1,}[.,]?\d{0,6}')),
                                    ],
                                    textInputType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                    suffixIcon: Padding(
                                        padding:
                                        const EdgeInsets.only(right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SFTextButton(
                                              text: LocaleKeys.all,
                                              textStyle: TextStyles.blue12,
                                              onPressed: () {
                                                if (args?.tokenEntity?.symbol == 'AVAX' || args?.tokenEntity?.symbol == null) {
                                                  if (state is GetTokenBalanceSuccess) {
                                                    final result = (Decimal.parse('${state.balance}') -
                                                        Decimal.parse('${state.fee}'))
                                                        .floor(scale: 6);
                                                    controllerAmount.text = result.toString();
                                                  }
                                                } else {
                                                  controllerAmount.text = args?.tokenEntity?.balance.toString() ?? '0';
                                                }
                                              },
                                              // color: Colors.transparent,
                                            ),
                                            SFIcon(args != null
                                                ? args.icon
                                                : Ics.icAvax),
                                          ],
                                        )),
                                    controller: controllerAmount,
                                    onChanged: (value) {
                                      cubit.init();
                                    },
                                  ),
                                  if (state is SendToExternalErrorValueInEther)
                                    SFText(
                                      keyText: state.msg,
                                      style: TextStyles.w400Red12,
                                    ),
                                  SFText(
                                      keyText: LocaleKeys.balance,
                                      style: TextStyles.w400lightGrey12,
                                      suffix:
                                      ': ${args != null ? args.tokenEntity?.balance.formatBalanceToken : balance.formatBalanceToken} ${args != null ? args.symbol : "AVAX"}'),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text.rich(
                              TextSpan(
                                text: LocaleKeys.the_network_you_have_selected_1
                                    .tr(),
                                style: TextStyles.w400lightGrey12,
                                children: [
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys.avalanche.tr(),
                                      style: TextStyles.w400Red12),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys
                                          .the_network_you_have_selected_2
                                          .tr()),
                                  TextSpan(
                                      text: LocaleKeys
                                          .the_network_you_have_selected_3
                                          .tr()),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys.avalanche.tr(),
                                      style: TextStyles.w400Red12),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys
                                          .the_network_you_have_selected_4
                                          .tr()),
                                  TextSpan(
                                      text: LocaleKeys
                                          .the_network_you_have_selected_5
                                          .tr(),
                                      style: context.locale.languageCode ==
                                          Const.localeJA.languageCode
                                          ? null
                                          : TextStyles.w400Red12),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys
                                          .the_network_you_have_selected_6
                                          .tr(),
                                      style: context.locale.languageCode ==
                                          Const.localeJA.languageCode
                                          ? TextStyles.w400Red12
                                          : null),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SFButton(
                        text: LocaleKeys.confirm,
                        textStyle: TextStyles.w600WhiteSize16,
                        width: double.infinity,
                        gradient: AppColors.gradientBlueButton,
                        // disabled: isDisabled,
                        onPressed: () {
                          if (fee != 0) {
                            if (args != null) {
                              if (controllerAmount.text.isNotEmpty) {
                                cubit.validator(
                                    contractAddressTo: contractAddressTo,
                                    balanceCurrent:
                                    args.tokenEntity?.balance ?? 0.0,
                                    amount: double.parse(controllerAmount.text
                                        .replaceAll(',', '.')),
                                    fee: fee);
                              } else {
                                cubit.validator(
                                    contractAddressTo: contractAddressTo,
                                    balanceCurrent:
                                    args.tokenEntity?.balance ?? 0.0,
                                    amount: -1, fee: fee);
                              }
                            } else {
                              if (controllerAmount.text.isNotEmpty) {
                                cubit.validator(
                                    contractAddressTo: contractAddressTo,
                                    balanceCurrent: balance,
                                    amount: double.parse(controllerAmount.text
                                        .replaceAll(',', '.')), fee: fee);
                              } else {
                                cubit.validator(
                                    contractAddressTo: contractAddressTo,
                                    balanceCurrent: balance,
                                    amount: -1, fee: fee);
                              }
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 37.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
