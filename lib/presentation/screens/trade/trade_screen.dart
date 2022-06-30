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
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon_border.dart';
import 'package:slee_fi/common/widgets/sf_sub_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/cool_dropdown/cool_dropdown.dart';
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
  int indexFrom = 0;
  int indexTo = Const.tokens.length - 1;

  final GlobalKey<CoolDropdownState> firstToken = GlobalKey();
  final GlobalKey<CoolDropdownState> secondToken = GlobalKey();
  TextEditingController valueController = TextEditingController();
  double amountOutMin = 0;

  int getIndexAddress(String address) {
    int index = -1;
    for (int i = 0; i < Const.tokens.length; i++) {
      if (address == Const.tokens[i]['address'].toString()) {
        index = i;
      }
    }
    return index;
  }

  onReset(cubit) {
    setState(() {
      isDisabled = true;
      valueController.text = '';
      indexFrom = 0;
      indexTo = Const.tokens.length - 1;
      Future.delayed(const Duration(milliseconds: 100), () {
        firstToken.currentState?.changeSelectedItem();
        secondToken.currentState?.changeSelectedItem();
      });
      cubit.getBalanceToken(Const.tokens[indexFrom]['address'].toString());
    });
  }

  onSwapIndex(cubit) {
    setState(() {
      isDisabled = true;
      valueController.text = '';
      int swap = indexTo;
      indexTo = indexFrom;
      indexFrom = swap;
      Future.delayed(const Duration(milliseconds: 100), () {
        firstToken.currentState?.changeSelectedItem();
        secondToken.currentState?.changeSelectedItem();
      });
      cubit.getBalanceToken(Const.tokens[indexFrom]['address'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TradeCubit()..init(),
      child: BlocConsumer<TradeCubit, TradeState>(
        listener: (BuildContext context, state) {
          final cubit = context.read<TradeCubit>();
          if (state is swapTokenBalance) {
            balance = state.balance;
            valueController.text = '';
            setState(() {
              isDisabled = true;
            });
          }
          if (state is swapTokenSuccess) {
            Navigator.pop(context);
            showSwapSuccessfulDialog(context, () {
              cubit.getBalanceToken(
                  Const.tokens[indexFrom]['address'].toString());
            });
          }
          if (state is tradeGetAmountOutMin) {
            amountOutMin = state.amountOutMin;
            showCustomAlertDialog(context,
                children: PopUpConfirmTrade(
                  value: double.parse(valueController.text.toString()),
                  symbolFrom: Const.tokens[indexFrom]['symbol'].toString(),
                  symbolTo: Const.tokens[indexTo]['symbol'].toString(),
                  addressFrom: Const.tokens[indexFrom]['address'].toString(),
                  addressTo: Const.tokens[indexTo]['address'].toString(),
                  onSwap: () {
                    cubit.swapToken(
                        double.parse(valueController.text.toString()),
                        Const.tokens[indexFrom]['address'].toString(),
                        Const.tokens[indexTo]['address'].toString());
                  },
                  amountOutMin: amountOutMin,
                ));
          }
        },
        builder: (BuildContext context, state) {
          final cubit = context.read<TradeCubit>();
          if (state is TradeStateInitial) {
            cubit
                .getBalanceToken(Const.tokens[indexFrom]['address'].toString());
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
                                onTap: () {
                                  onReset(cubit);
                                },
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
                                        keyText:
                                            ': ${balance.toStringAsFixed(6)}',
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
                                                        (indexFrom == 0
                                                                ? balance - 0.01
                                                                : balance)
                                                            .toStringAsFixed(6);
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
                                            globalKey: firstToken,
                                            width: 90,
                                            height: 36,
                                            indexInit: indexFrom,
                                            resultPadding:
                                                const EdgeInsets.all(0),
                                            backgroundColor:
                                                AppColors.transparent,
                                            isResultLabel: true,
                                            tokens: Const.tokens,
                                            onChange: (selectItem) {
                                              setState(() {
                                                'run to set default value start'
                                                    .log;
                                                if (selectItem["value"] ==
                                                    Const.tokens[indexTo]
                                                        ['address']) {
                                                  indexTo = indexFrom;
                                                }
                                                indexFrom = getIndexAddress(
                                                    selectItem["value"]
                                                        .toString());
                                                cubit.getBalanceToken(Const
                                                    .tokens[indexFrom]
                                                        ['address']
                                                    .toString());
                                                valueController.text = '';
                                                log("message $indexFrom $indexTo");
                                              });
                                              Future.delayed(
                                                const Duration(
                                                    milliseconds: 100),
                                                () => secondToken.currentState
                                                    ?.changeSelectedItem(),
                                              );
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
                            Center(
                                child: GestureDetector(
                              onTap: () {
                                onSwapIndex(cubit);
                              },
                              child: const Icon(
                                Icons.swap_vert,
                                color: AppColors.lightWhite,
                                size: 32,
                              ),
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
                                        globalKey: secondToken,
                                        width: 90,
                                        height: 36,
                                        indexInit: indexTo,
                                        resultPadding: const EdgeInsets.all(0),
                                        backgroundColor: AppColors.transparent,
                                        isResultLabel: true,
                                        tokens: Const.tokens,
                                        onChange: (selectItem) {
                                          setState(() {
                                            if (selectItem['value'] ==
                                                Const.tokens[indexFrom]
                                                    ['address']) {
                                              indexFrom = indexTo;
                                            }
                                            indexTo = getIndexAddress(
                                                selectItem['value'].toString());
                                            cubit.getBalanceToken(Const
                                                .tokens[indexFrom]['address']
                                                .toString());
                                            valueController.text = '';
                                            log("message $indexFrom $indexTo");
                                          });
                                          Future.delayed(
                                            const Duration(milliseconds: 100),
                                            () => firstToken.currentState
                                                ?.changeSelectedItem(),
                                          );
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
                          cubit.getAmountOutMin(
                              Const.tokens[indexFrom]['address'].toString(),
                              Const.tokens[indexTo]['address'].toString(),
                              double.parse(valueController.text.toString()));
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
