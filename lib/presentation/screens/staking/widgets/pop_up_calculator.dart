import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/roi_staked.dart';
import 'package:slee_fi/resources/resources.dart';

class PopUpCalculator extends StatefulWidget {
  final String? aprInDay;
  final double? priceUsd;
  final double myBalance;
  const PopUpCalculator({required this.myBalance, required this.priceUsd, required this.aprInDay, Key? key}) : super(key: key);

  @override
  State<PopUpCalculator> createState() => _PopUpCalculatorState();
}

class _PopUpCalculatorState extends State<PopUpCalculator> {
  final GlobalKey<SLFTStakedState> stakedKey = GlobalKey();
  TextEditingController rateEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool isChangedRates = true;
  double currentRatesChange = 0;
  double amountStaked = 0;
  double? currentRate;
  double? currentRatesToToken;
  double? percentCurrentRatesToToken;

  @override
  void initState() {
    rateEditingController = TextEditingController()
      ..addListener(() {
      });
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    rateEditingController.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if(_focus.hasFocus){
      setState((){
        isChangedRates = false;
      });
    }else {
      setState((){
        isChangedRates = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: SFText(
            keyText: LocaleKeys.roi_calculator,
            style: TextStyles.bold18LightWhite,
          )),
          const SizedBox(
            height: 24,
          ),
          // SFText(
          //   keyText: LocaleKeys.flexible,
          //   style: TextStyles.bold16Blue,
          //   textAlign: TextAlign.start,
          // ),
          // const SizedBox(
          //   height: 12.0,
          // ),
          SFText(
            keyText:
                "SLFT ${LocaleKeys.staked.tr()}",
            style: TextStyles.lightGrey14,
          ),
          SLFTStaked(
              key: stakedKey,
              readonly: !isChangedRates,
              apr: widget.aprInDay,
              myBalance: widget.myBalance,
              priceUsd: widget.priceUsd ?? 0,
              staked: (staked) {
                if(staked.day == 0 && staked.amount == 0){
                  setState((){
                    rateEditingController.text = '';
                    currentRatesToToken = null;
                    percentCurrentRatesToToken = null;
                    amountStaked = 0;
                  });
                }
                if(widget.aprInDay != null){
                  currentRate = double.parse(widget.aprInDay!) * staked.day * staked.amount;
                  setState((){
                    rateEditingController.text = currentRate!.formatBalanceToken;
                    currentRatesToToken = (currentRate! / 0.2);
                    amountStaked = staked.amount;
                    percentCurrentRatesToToken = (currentRate!/staked.amount*100);
                  });
                }else {
                  rateEditingController.text = '';
                  currentRatesToToken = null;
                  percentCurrentRatesToToken = null;
                }
          }),
          const SizedBox(
            height: 32.0,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              margin: const EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: AppColors.lightDark),
                  gradient: AppColors.gradientROI),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SFText(
                            keyText: LocaleKeys.roi_current_rates,
                            style: TextStyles.blue14,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SFTextField(
                            controller: rateEditingController,
                            focusNode: _focus,
                            showLabel: false,
                            noBorder: true,
                            readonly: isChangedRates,
                            onChanged: (rates){
                              if(rateEditingController.text.isNotEmpty){
                                setState((){
                                  currentRatesToToken = double.parse(rateEditingController.text)/0.2;
                                  percentCurrentRatesToToken = (currentRate!/amountStaked*100);
                                });
                              }else {
                                setState((){
                                  currentRatesToToken = null;
                                  percentCurrentRatesToToken = null;
                                });
                              }
                              stakedKey.currentState?.currentRatesCalculator(rates);
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter
                                  .allow(RegExp(
                                  r'^\d{1,}[.,]?\d{0,6}')),
                            ],
                            textInputType:
                            const TextInputType.numberWithOptions(
                                decimal: true),
                            textStyle: TextStyles.bold24LightWhite,
                            hintText: '0.00',
                            hintStyle: TextStyles.bold24LightWhite,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SFText(
                            keyText: "~ ${currentRatesToToken != null ? currentRatesToToken!.formatBalanceToken : 0} SLFT (${(percentCurrentRatesToToken ?? 0.00).toStringAsFixed(2)}%)",
                            style: TextStyles.lightGrey14,
                          ),
                        ],
                      )),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChangedRates = !isChangedRates;
                      });
                    },
                    child: isChangedRates
                        ? const SFIcon(
                      Ics.icEdit,
                      width: 28,
                    )
                        : const Icon(
                      Icons.check,
                      color: AppColors.green,
                      size: 32,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
