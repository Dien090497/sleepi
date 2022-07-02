import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
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

class SendToExternalArguments{
  final String symbol;
  final String icon;
  final TokenEntity? tokenEntity;

  SendToExternalArguments({required this.symbol, required this.icon, this.tokenEntity});
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
  double valueInEther = 0;

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
            setState(() {});
          }
          if (state is SendToExternalCheckedValidator) {
            showCustomAlertDialog(context,
                children:  PopUpConfirmSend(
                  toAddress: contractAddressTo,
                  valueInEther: valueInEther,
                  transferToken: args != null ? true : false,
                  arg: args,
                )
            );
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
                          args != null ?  SFIcon(args.icon, width: 60, height: 60,) : Image.asset(Imgs.sendToExternal),
                             SizedBox(height: args != null ? 32 : 0,),
                            SFCard(
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AddressScan(
                                    errorText: state is SendToExternalErrorToAddress
                                        ? state.msg
                                        : null,
                                    onChangedAddress: (address){
                                      cubit.contractAddressTo = address;
                                      contractAddressTo = address;
                                    },
                                  ),
                                  const SizedBox(height: 24),
                                  SFTextField(
                                    labelText: LocaleKeys.amount,
                                      inputFormatters: [DecimalTextInputFormatter(decimalRange: 6)],
                                    textInputType: const TextInputType.numberWithOptions(decimal: true),
                                    errorText:state is SendToExternalErrorValueInEther
                                        ? state.msg
                                        : null,
                                    suffixIcon:  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SFIcon(
                                        args != null ? args.icon : Ics.icAvax
                                      )
                                    ),
                                    onChanged: (v) {
                                      if (v.isNotEmpty) {
                                        cubit.valueInEther = double.parse(v);
                                        valueInEther = double.parse(v);
                                      }

                                    }
                                  ),
                                  SFText(
                                      keyText: LocaleKeys.balance,
                                      style: TextStyles.w400lightGrey12,
                                      suffix: ': ${args != null ? args.tokenEntity?.balance : balance} ${args != null ? args.symbol : "AVAX"}'),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text.rich(
                              TextSpan(
                                text: LocaleKeys.the_network_you_have_selected_1.tr(),
                                style: TextStyles.w400lightGrey12,
                                children: [
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys.avalanche.tr(),
                                      style: TextStyles.w400Red12),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys.the_network_you_have_selected_2
                                          .tr()),
                                  TextSpan(
                                      text: LocaleKeys.the_network_you_have_selected_3
                                          .tr()),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys.avalanche.tr(),
                                      style: TextStyles.w400Red12),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys.the_network_you_have_selected_4
                                          .tr()),
                                  TextSpan(
                                      text: LocaleKeys.the_network_you_have_selected_5
                                          .tr(),
                                      style: context.locale.languageCode ==
                                          Const.localeJA.languageCode
                                          ? null
                                          : TextStyles.w400Red12),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                      text: LocaleKeys.the_network_you_have_selected_6
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
                          if (args != null) {
                            cubit.validator(args.tokenEntity?.balance ?? 0.0);
                          } else {
                            cubit.validator(balance);
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