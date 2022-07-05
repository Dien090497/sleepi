import 'dart:async';
import 'dart:developer';

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
import 'package:slee_fi/common/widgets/cool_dropdown/cool_dropdown.dart';
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
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_cubit.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/dropdown_select_token.dart';
import 'package:slee_fi/presentation/screens/trade/widgets/pop_up_confirm_trade.dart';

class TradeArguments {
  final String? contractAddress;

  TradeArguments(this.contractAddress);
}

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  late double balance = 0;
  late int indexFrom;
  late int indexTo;
  String error = '';

  final GlobalKey<CoolDropdownState> firstToken = GlobalKey();
  final GlobalKey<CoolDropdownState> secondToken = GlobalKey();
  TextEditingController valueController = TextEditingController();
  FocusNode focusNode = FocusNode();
  double amountOutMin = 0;
  Timer? _debounce;

  int getIndexAddress(String address) {
    int index = -1;
    for (int i = 0; i < Const.tokens.length; i++) {
      if (address.toLowerCase() ==
          Const.tokens[i]['address'].toString().toLowerCase()) {
        index = i;
      }
    }
    return index;
  }

  onValidValue() {
    if (valueController.text != '') {
      if (double.parse(valueController.text) > balance) {
        error = LocaleKeys.insufficient_balance;
      } else if (double.parse(valueController.text) == 0) {
        error = LocaleKeys.not_be_zero;
      } else {
        error = '';
      }
    }
  }

  onReset(cubit) {
    setState(() {
      valueController.text = '';
      amountOutMin = 0;
      error = '';
      indexFrom = 0;
      indexTo = Const.tokens.length - 1;
    });
    focusNode.unfocus();
    Future.delayed(const Duration(milliseconds: 100), () {
      firstToken.currentState?.changeSelectedItem();
      secondToken.currentState?.changeSelectedItem();
      cubit.getBalanceToken(Const.tokens[indexFrom]['address'].toString());
    });
  }

  onSwapIndex(cubit) {
    setState(() {
      valueController.text = '';
      amountOutMin = 0;
      error = '';
      int swap = indexTo;
      indexTo = indexFrom;
      indexFrom = swap;
    });
    focusNode.unfocus();

    Future.delayed(const Duration(milliseconds: 100), () {
      firstToken.currentState?.changeSelectedItem();
      secondToken.currentState?.changeSelectedItem();
      cubit.getBalanceToken(Const.tokens[indexFrom]['address'].toString());
    });
  }

  @override
  void dispose() {
    if (_debounce != null) _debounce!.cancel();
    valueController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments as TradeArguments;
      setState(() {
        indexFrom = getIndexAddress(args.contractAddress!);
        if (indexFrom != 0) {
          indexTo = 0;
        } else {
          indexTo = Const.tokens.length - 1;
        }
      });
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      firstToken.currentState?.changeSelectedItem();
      secondToken.currentState?.changeSelectedItem();
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
            setState(() {
              balance = state.balance;
            });
          }
          if (state is swapTokenSuccess) {
            Navigator.pop(context);
            if (state.success) {
              showSuccessfulDialog(context, null).then((value) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 3000), () async {
                  cubit.getBalanceToken(
                      Const.tokens[indexFrom]['address'].toString());
                });
              });
            }
          }
          if (state is TradeStateInitial) {
            setState(() {
              valueController.text = '';
              amountOutMin = 0;
              error = '';
            });
          }
        },
        builder: (BuildContext context, state) {
          if (state is tradeGetAmountOutMin) {
            if (valueController.text != '') {
              amountOutMin = state.amountOutMin;
            } else {
              amountOutMin = 0;
            }
          }
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
                                            ': ${balance.formatBalanceToken}',
                                        style: TextStyles.lightGrey12,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: SFTextField(
                                                controller: valueController,
                                                focusNode: focusNode,
                                                showLabel: false,
                                                noBorder: true,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          r'^\d{1,}\.?\d{0,6}')),
                                                ],
                                                textInputType:
                                                const TextInputType.numberWithOptions(
                                                    decimal: true),
                                                hintText: "0.00",
                                                hintStyle:
                                                    TextStyles.bold16LightWhite,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    setState(() {
                                                      onValidValue();
                                                      cubit.getAmountOutMin(
                                                          Const
                                                              .tokens[indexFrom]
                                                                  ['address']
                                                              .toString(),
                                                          Const.tokens[indexTo]
                                                                  ['address']
                                                              .toString(),
                                                          double.parse(
                                                              valueController
                                                                  .text
                                                                  .toString()));
                                                    });
                                                  } else {
                                                    setState(() {
                                                      amountOutMin = 0;
                                                      error = '';
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
                                                      fixedSize:
                                                          const Size(34, 21),
                                                      title: LocaleKeys.max,
                                                      textStyle:
                                                          TextStyles.bold14Blue,
                                                      borderColor:
                                                          AppColors.blue,
                                                      onPressed: () {
                                                        valueController.text =
                                                            (indexFrom == 0
                                                                    ? balance -
                                                                        0.01
                                                                    : balance)
                                                                .toString();
                                                        Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  100),
                                                          () => cubit.getAmountOutMin(
                                                              Const.tokens[
                                                                      indexFrom]
                                                                      [
                                                                      'address']
                                                                  .toString(),
                                                              Const.tokens[
                                                                      indexTo][
                                                                      'address']
                                                                  .toString(),
                                                              double.parse(
                                                                  valueController
                                                                      .text
                                                                      .toString())),
                                                        );
                                                        error = '';
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
                                                width: 110,
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
                                                    amountOutMin = 0;
                                                    error = '';
                                                    log("message $indexFrom $indexTo");
                                                  });
                                                  Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100),
                                                    () => secondToken
                                                        .currentState
                                                        ?.changeSelectedItem(),
                                                  );
                                                  FocusScope.of(context)
                                                      .requestFocus(focusNode);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SFText(
                                        keyText: error,
                                        style: TextStyles.red12W700,
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
                                      Expanded(
                                        child: SizedBox(
                                          child: SFText(
                                            maxLines: 1,
                                            keyText: "$amountOutMin",
                                            style: TextStyles.bold18White,
                                          ),
                                        ),
                                      ),
                                      DropdownSelectToken(
                                        globalKey: secondToken,
                                        width: 110,
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
                                            log("message $indexFrom $indexTo");
                                          });
                                          Future.delayed(
                                            const Duration(milliseconds: 100),
                                            () => firstToken.currentState
                                                ?.changeSelectedItem(),
                                          );
                                          cubit.getAmountOutMin(
                                              Const
                                                  .tokens[indexFrom]
                                              ['address']
                                                  .toString(),
                                              Const.tokens[indexTo]
                                              ['address']
                                                  .toString(),
                                              double.parse(
                                                  valueController
                                                      .text
                                                      .toString()));
                                          FocusScope.of(context)
                                              .requestFocus(focusNode);
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
                        onPressed: () {
                          setState(() {
                            onValidValue();
                            if (valueController.text == '') {
                              error = LocaleKeys.field_required;
                            }
                          });
                          if (error == '') {
                            showCustomAlertDialog(context,
                                children: PopUpConfirmTrade(
                                  value: double.parse(
                                      valueController.text.toString()),
                                  symbolFrom: Const.tokens[indexFrom]['symbol']
                                      .toString(),
                                  symbolTo: Const.tokens[indexTo]['symbol']
                                      .toString(),
                                  addressFrom: Const.tokens[indexFrom]
                                          ['address']
                                      .toString(),
                                  addressTo: Const.tokens[indexTo]['address']
                                      .toString(),
                                  onSwap: () {
                                    cubit.swapToken(
                                        double.parse(
                                            valueController.text.toString()),
                                        Const.tokens[indexFrom]['address']
                                            .toString(),
                                        Const.tokens[indexTo]['address']
                                            .toString());
                                  },
                                  amountOutMin: amountOutMin,
                                )).then((value) => cubit.init());
                          }
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
