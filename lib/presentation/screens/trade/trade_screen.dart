import 'dart:async';
import 'dart:developer';

import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/cool_dropdown/cool_dropdown.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon_border.dart';
import 'package:slee_fi/common/widgets/sf_sub_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_cubit.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/dropdown_select_token.dart';
import 'package:slee_fi/presentation/screens/trade/widgets/pop_up_approve_trade.dart';
import 'package:slee_fi/presentation/screens/trade/widgets/pop_up_confirm_trade.dart';
import 'package:slee_fi/usecase/estimate_trade_token_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class TradeArguments {
  final String? symbolFrom;
  final String? symbolTo;

  TradeArguments({this.symbolFrom, this.symbolTo});
}

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  late List<dynamic> listTokens = [];
  late double balance = 0;
  late double estimate = 0;
  late int indexFrom = 0;
  late int indexTo = 0;
  late String error = '';

  final GlobalKey<CoolDropdownState> firstToken = GlobalKey();
  final GlobalKey<CoolDropdownState> secondToken = GlobalKey();
  final TextEditingController valueController = TextEditingController();
  FocusNode focusNode = FocusNode();
  double amountOutMin = 0;
  Timer? _debounce;
  final tradeCubit = TradeCubit()..init();

  int getIndexAddress(String address) {
    int index = 0;
    for (int i = 0; i < listTokens.length; i++) {
      if (address.toLowerCase() ==
          listTokens[i]['address'].toString().toLowerCase()) {
        index = i;
      }
    }
    return index;
  }

  int getIndexSymbol(String symbol) {
    int index = 0;
    for (int i = 0; i < listTokens.length; i++) {
      if (symbol.toLowerCase() ==
          listTokens[i]['symbol'].toString().toLowerCase()) {
        index = i;
      }
    }
    return index;
  }

  onValidValue(amountMin) {
    if (valueController.text.trim() != '') {
      final result = valueController.text.toString().contains(',')
          ? valueController.text.toString().replaceAll(',', '.')
          : valueController.text.toString();
      if (double.parse(result) == 0) {
        error = LocaleKeys.amount_input_can_not_be_zero;
      } else if (indexFrom == 0 && double.parse(result) > balance - estimate ||
          double.parse(result) > balance) {
        error = LocaleKeys.insufficient_balance;
      } else if (amountMin == 0 && double.parse(result) != 0) {
        error = LocaleKeys.input_value_so_small;
      } else {
        error = '';
      }
    } else {
      error = LocaleKeys.field_required;
    }
  }

  onReset(cubit) {
    setState(() {
      valueController.text = '';
      amountOutMin = 0;
      error = '';
    });
    focusNode.unfocus();
    cubit.getBalanceToken(listTokens[indexFrom]['address'].toString());
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
    tradeCubit.getBalanceToken(listTokens[indexFrom]['address'].toString());
    Future.delayed(const Duration(milliseconds: 100), () {
      firstToken.currentState?.changeSelectedItem();
      secondToken.currentState?.changeSelectedItem();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  init(BuildContext context) async {
    final args = ModalRoute.of(context)?.settings.arguments as TradeArguments;
    indexFrom = getIndexSymbol(args.symbolFrom!);
    if (args.symbolTo == null) {
      if (indexFrom != 0) {
        indexTo = 0;
      } else {
        indexTo = listTokens.length - 1;
      }
    } else {
      indexTo = getIndexSymbol(args.symbolTo!);
    }
    await getIt<EstimateTradeTokenUseCase>().call(NoParams()).then((value) {
      value.fold((l) {
        showMessageDialog(context, l.toString())
            .then((value) => Navigator.pop(context));
      }, (r) {
        estimate = r + r * 0.1;
      });
    });
    Future.delayed(const Duration(milliseconds: 200), () async {
      firstToken.currentState?.changeSelectedItem();
      secondToken.currentState?.changeSelectedItem();
      tradeCubit.getBalanceToken(listTokens[indexFrom]['address'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: DismissKeyboardWidget(
        child: BackgroundWidget(
          resizeToAvoidBottomInset: false,
          child: BlocProvider(
            create: (BuildContext context) => tradeCubit,
            child: BlocConsumer<TradeCubit, TradeState>(
              listener: (BuildContext context, state) async {
                if (state is swapTokenBalance) {
                  setState(() {
                    balance = state.balance;
                  });
                }

                if (state is swapTokenAllowance) {
                  if (state.approve) {
                    showCustomAlertDialog(context,
                        children: PopUpConfirmApproveTrade(
                          tokenName: listTokens[indexFrom]['symbol'].toString(),
                          cubit: tradeCubit,
                          contractAddress:
                              listTokens[indexFrom]['address'].toString(),
                        ));
                  } else {
                    final result = valueController.text.toString().contains(',')
                        ? valueController.text.toString().replaceAll(',', '.')
                        : valueController.text.toString();
                    showCustomAlertDialog(context,
                        children: PopUpConfirmTrade(
                          value: double.parse(result),
                          symbolFrom:
                              listTokens[indexFrom]['symbol'].toString(),
                          symbolTo: listTokens[indexTo]['symbol'].toString(),
                          addressFrom:
                              listTokens[indexFrom]['address'].toString(),
                          addressTo: listTokens[indexTo]['address'].toString(),
                          cubit: tradeCubit,
                          amountOutMin: amountOutMin,
                        )).then((value) {
                      tradeCubit.getBalanceToken(
                          listTokens[indexFrom]['address'].toString());
                    });
                  }
                }

                if (state is swapTokenSuccess) {
                  showApproveSuccessfulDialog(
                    context,
                    txHash: state.txh,
                  ).then((value) {
                    setState(() {
                      valueController.text = '';
                      amountOutMin = 0;
                      error = '';
                    });
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce =
                        Timer(const Duration(milliseconds: 2000), () async {
                      tradeCubit.getBalanceToken(
                          listTokens[indexFrom]['address'].toString());
                    });
                  });
                }

                if (state is swapTokenFail) {
                  if (state.msg == LocaleKeys.not_enough_to_pay_the_fee ||
                      indexFrom == 0) {
                    showMessageDialog(context, state.msg);
                  } else {
                    showCustomAlertDialog(context,
                        children: PopUpConfirmApproveTrade(
                          tokenName: listTokens[indexFrom]['symbol'].toString(),
                          cubit: tradeCubit,
                          contractAddress:
                              listTokens[indexFrom]['address'].toString(),
                        ));
                  }
                }

                if (state is approveTokenSuccess) {
                  showApproveSuccessfulDialog(
                    context,
                    txHash: state.txh,
                  );
                }
              },
              builder: (BuildContext context, state) {
                if (state is tradeGetAmountOutMin) {
                  if (valueController.text != '') {
                    amountOutMin = state.amountOutMin;
                  } else {
                    amountOutMin = 0;
                  }
                  onValidValue(amountOutMin);
                }
                if (state is TradeStateInitial && state.isLoading) {
                  listTokens = state.listTokens;
                  init(context);
                }
                if (state is TradeStateInitial && state.isLoading ||
                    state is! TradeStateInitial) {
                  return Stack(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          onReset(tradeCubit);
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
                                                  style:
                                                      TextStyles.lightGrey12),
                                              SFText(
                                                keyText:
                                                    ': ${balance >= 0.000001 ? balance.formatCurrency : 0}',
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: SFTextField(
                                                        controller:
                                                            valueController,
                                                        focusNode: focusNode,
                                                        showLabel: false,
                                                        noBorder: true,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'^\d{1,}[.,]?\d{0,6}')),
                                                        ],
                                                        textInputType:
                                                            const TextInputType
                                                                    .numberWithOptions(
                                                                decimal: true),
                                                        hintText: "0.00",
                                                        hintStyle: TextStyles
                                                            .bold16LightWhite,
                                                        onChanged: (value) {
                                                          if (value
                                                              .isNotEmpty) {
                                                            setState(() {
                                                              final result = valueController.text
                                                                      .toString()
                                                                      .contains(
                                                                          ',')
                                                                  ? valueController
                                                                      .text
                                                                      .toString()
                                                                      .replaceAll(
                                                                          ',',
                                                                          '.')
                                                                  : valueController
                                                                      .text
                                                                      .toString();
                                                              tradeCubit.getAmountOutMin(
                                                                  listTokens[indexFrom]
                                                                          [
                                                                          'address']
                                                                      .toString(),
                                                                  listTokens[indexTo]
                                                                          [
                                                                          'address']
                                                                      .toString(),
                                                                  double.parse(
                                                                      result));
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
                                                      alignment:
                                                          Alignment.center,
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: SizedBox(
                                                          width: 80,
                                                          child:
                                                              SFButtonOutLined(
                                                                  fixedSize:
                                                                      const Size(
                                                                          34,
                                                                          21),
                                                                  title:
                                                                      LocaleKeys
                                                                          .max,
                                                                  textStyle:
                                                                      TextStyles
                                                                          .bold14Blue,
                                                                  borderColor:
                                                                      AppColors
                                                                          .blue,
                                                                  onPressed:
                                                                      () {
                                                                    if (balance >=
                                                                        0.000001) {
                                                                      valueController
                                                                          .text = (indexFrom == 0
                                                                              ? (balance - estimate) > 0
                                                                                  ? (balance - estimate)
                                                                                  : 0
                                                                              : balance)
                                                                          .formatBalanceToken;
                                                                      Future.delayed(
                                                                          const Duration(
                                                                              milliseconds: 100),
                                                                          () {
                                                                        final result = valueController.text.replaceAll(
                                                                            ',',
                                                                            '.');
                                                                        tradeCubit.getAmountOutMin(
                                                                            listTokens[indexFrom]['address'].toString(),
                                                                            listTokens[indexTo]['address'].toString(),
                                                                            double.parse(result));
                                                                      });
                                                                      error =
                                                                          '';
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      valueController
                                                                              .text =
                                                                          '0';
                                                                    }
                                                                  }),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child:
                                                          DropdownSelectToken(
                                                        globalKey: firstToken,
                                                        width: 110,
                                                        height: 36,
                                                        indexInit: indexFrom,
                                                        resultPadding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        backgroundColor:
                                                            AppColors
                                                                .transparent,
                                                        isResultLabel: true,
                                                        tokens: listTokens,
                                                        onChange: (selectItem) {
                                                          setState(() {
                                                            if (selectItem[
                                                                        "value"]
                                                                    .toString()
                                                                    .toLowerCase() ==
                                                                listTokens[indexTo]
                                                                        [
                                                                        'address']
                                                                    .toString()
                                                                    .toLowerCase()) {
                                                              indexTo =
                                                                  indexFrom;
                                                            }
                                                            indexFrom = getIndexAddress(
                                                                selectItem[
                                                                        "value"]
                                                                    .toString());
                                                            tradeCubit.getBalanceToken(
                                                                listTokens[indexFrom]
                                                                        [
                                                                        'address']
                                                                    .toString());
                                                            valueController
                                                                .text = '';
                                                            amountOutMin = 0;
                                                            error = '';
                                                            log("message $indexFrom $indexTo");
                                                          });
                                                          Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                            () => secondToken
                                                                .currentState
                                                                ?.changeSelectedItem(),
                                                          );
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  focusNode);
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
                                        onSwapIndex(tradeCubit);
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
                                                  style:
                                                      TextStyles.lightGrey14),
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
                                                    keyText:
                                                        "${Decimal.parse(amountOutMin.toString())}",
                                                    style:
                                                        TextStyles.bold18White,
                                                  ),
                                                ),
                                              ),
                                              DropdownSelectToken(
                                                globalKey: secondToken,
                                                width: 110,
                                                height: 36,
                                                indexInit: indexTo,
                                                resultPadding:
                                                    const EdgeInsets.all(0),
                                                backgroundColor:
                                                    AppColors.transparent,
                                                isResultLabel: true,
                                                tokens: listTokens,
                                                onChange: (selectItem) {
                                                  setState(() {
                                                    if (selectItem['value']
                                                            .toString()
                                                            .toLowerCase() ==
                                                        listTokens[indexFrom]
                                                                ['address']
                                                            .toString()
                                                            .toLowerCase()) {
                                                      indexFrom = indexTo;
                                                    }
                                                    indexTo = getIndexAddress(
                                                        selectItem['value']
                                                            .toString());
                                                    log("message $indexFrom $indexTo");
                                                  });
                                                  Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100),
                                                    () => firstToken
                                                        .currentState
                                                        ?.changeSelectedItem(),
                                                  );
                                                  final result = valueController
                                                          .text
                                                          .toString()
                                                          .contains(',')
                                                      ? valueController.text
                                                          .toString()
                                                          .replaceAll(',', '.')
                                                      : valueController.text
                                                          .toString();

                                                  tradeCubit.getAmountOutMin(
                                                      listTokens[indexFrom]
                                                              ['address']
                                                          .toString(),
                                                      listTokens[indexTo]
                                                              ['address']
                                                          .toString(),
                                                      double.parse(result));
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
                                text: LocaleKeys.trade
                                    .reCase(StringCase.titleCase),
                                textStyle: TextStyles.w600WhiteSize16,
                                gradient: AppColors.gradientBlueButton,
                                onPressed: () async {
                                  setState(() {
                                    onValidValue(amountOutMin);
                                  });
                                  if (error == '') {
                                    final result = valueController.text
                                            .toString()
                                            .contains(',')
                                        ? valueController.text
                                            .toString()
                                            .replaceAll(',', '.')
                                        : valueController.text.toString();

                                    if (indexFrom != 0) {
                                      tradeCubit.checkApproveToken(
                                          double.parse(result),
                                          listTokens[indexFrom]['address']
                                              .toString());
                                    } else {
                                      if (estimate > balance) {
                                        showMessageDialog(
                                            context,
                                            LocaleKeys
                                                .not_enough_to_pay_the_fee);
                                      } else {
                                        showCustomAlertDialog(context,
                                            children: PopUpConfirmTrade(
                                              value: double.parse(result),
                                              symbolFrom: listTokens[indexFrom]
                                                      ['symbol']
                                                  .toString(),
                                              symbolTo: listTokens[indexTo]
                                                      ['symbol']
                                                  .toString(),
                                              addressFrom: listTokens[indexFrom]
                                                      ['address']
                                                  .toString(),
                                              addressTo: listTokens[indexTo]
                                                      ['address']
                                                  .toString(),
                                              cubit: tradeCubit,
                                              amountOutMin: amountOutMin,
                                            )).then((value) {
                                          tradeCubit.getBalanceToken(
                                              listTokens[indexFrom]['address']
                                                  .toString());
                                        });
                                      }
                                    }
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
                      if (state is swapLoading) const LoadingScreen(),
                    ],
                  );
                } else {
                  return const LoadingScreen();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
