import 'dart:developer';

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
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon_border.dart';
import 'package:slee_fi/common/widgets/sf_sub_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_cubit.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/dropdown_select_token.dart';
import 'package:slee_fi/presentation/screens/trade/widgets/pop_up_confirm_trade.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  bool isDisabled = true;
  late double balance = 0;
  String tokenFrom = Const.tokens[0]["address"].toString();
  String tokenTo = Const.tokens[Const.tokens.length - 1]["address"].toString();
  String symbolFrom = 'AVAX';
  String symbolTo = 'USDC';
  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TradeCubit()..init(),
      child: BlocConsumer<TradeCubit, TradeState>(
        listener: (BuildContext context, state) {
          if (state is swapTokenBalance) {
            balance = state.balance;
            log("message  $balance");
            setState(() {});
          }
        },
        builder: (BuildContext context, state) {
          final cubit = context.read<TradeCubit>();
          if (state is TradeStateInitial) {
            cubit.getBalanceToken(tokenFrom);
          }
          return DismissKeyboardWidget(
            child: BackgroundWidget(
              resizeToAvoidBottomInset: false,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SFSubAppBar(
                                title: LocaleKeys.trade
                                    .reCase(StringCase.titleCase),
                                textStyle: TextStyles.bold18LightWhite,
                                stringCase: StringCase.titleCase,
                              ),
                            ),
                            GestureDetector(
                                child: const SFIconBorder(
                                    icon: Icons.refresh, sizeIcon: 28)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            SFCard(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SFText(
                                        keyText: LocaleKeys.from,
                                        style: TextStyles.lightGrey12,
                                      ),
                                      const Spacer(),
                                      SFText(
                                          keyText: LocaleKeys.balance,
                                          style: TextStyles.lightGrey12),
                                      SFText(
                                        keyText: ': $balance',
                                        style: TextStyles.lightGrey12,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: SFTextField(
                                            controller: valueController,
                                            showLabel: false,
                                            noBorder: true,
                                            textInputType: TextInputType.number,
                                            hintText: "0.00",
                                            hintStyle:
                                                TextStyles.bold16LightWhite,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                setState(() {
                                                  valueController.text = value;
                                                  isDisabled = false;
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: SizedBox(
                                              width: 80,
                                              child: SFButtonOutLined(
                                                  fixedSize: const Size(34, 21),
                                                  title: LocaleKeys.max,
                                                  textStyle:
                                                      TextStyles.bold14Blue,
                                                  borderColor: AppColors.blue,
                                                  onPressed: () {
                                                    valueController.text =
                                                        '${balance - balance * 0.1}';
                                                    isDisabled = false;
                                                    setState(() {});
                                                  }),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: DropdownSelectToken(
                                            width: 90,
                                            height: 36,
                                            resultPadding:
                                                const EdgeInsets.all(0),
                                            backgroundColor:
                                                AppColors.transparent,
                                            isResultLabel: true,
                                            tokens: Const.tokens,
                                            onChange: (selectItem) {
                                              log("  $selectItem");
                                              tokenFrom = selectItem["value"];
                                              symbolFrom = selectItem["label"];
                                              cubit.getBalanceToken(tokenFrom);
                                              valueController.text = '';
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Center(
                                child: Icon(
                              Icons.swap_vert,
                              color: AppColors.lightWhite,
                              size: 32,
                            )),
                            const SizedBox(height: 8),
                            SFCard(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SFText(
                                        keyText: LocaleKeys.to,
                                        style: TextStyles.lightGrey14,
                                      ),
                                      SFText(
                                          keyText:
                                              ' (${LocaleKeys.estimate.tr()})',
                                          style: TextStyles.lightGrey14),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      DropdownSelectToken(
                                        width: 90,
                                        height: 36,
                                        indexInit: Const.tokens.length - 1,
                                        resultPadding: const EdgeInsets.all(0),
                                        backgroundColor: AppColors.transparent,
                                        isResultLabel: true,
                                        tokens: Const.tokens,
                                        onChange: (selectItem) {
                                          tokenTo = selectItem['value'];
                                          symbolTo = selectItem['label'];
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SFButton(
                        width: double.infinity,
                        text: LocaleKeys.trade.reCase(StringCase.titleCase),
                        textStyle: TextStyles.w600WhiteSize16,
                        gradient: AppColors.gradientBlueButton,
                        disabled: isDisabled,
                        onPressed: () {
                          showCustomAlertDialog(context,
                              children: PopUpConfirmTrade(
                                value: double.parse(valueController.text.toString()),
                                symbolFrom: symbolFrom,
                                symbolTo: symbolTo,
                                addressFrom: tokenFrom,
                                addressTo: tokenTo,
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 24.0,
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
