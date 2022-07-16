import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_chip.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class StakedArguments{
  final int day;
  final double amount;
  StakedArguments({required this.day, required this.amount});
}

class SLFTStaked extends StatefulWidget {
  final Function(StakedArguments) staked;
  final String? apr;
  final double priceUsd;
  final bool readonly;
  const SLFTStaked({this.readonly = false, required this.priceUsd, required this.staked, required this.apr, Key? key}) : super(key: key);


  @override
  SLFTStakedState createState() => SLFTStakedState();
}

class SLFTStakedState extends State<SLFTStaked> {
  TextEditingController _amountEditingController = TextEditingController();
  TextEditingController dayEditingController = TextEditingController();
  bool swapText = false;
  int? selectedIndex;
  String amountPrice = '';
  int? selectedDurationIndex = 0;

  List<String> days = ["1", "7", "15", "30"];
  List<String> balance = ["100", "10000", LocaleKeys.my_balance.tr()];

  @override
  void initState() {
    _amountEditingController = TextEditingController()
      ..addListener(() {

      });
    dayEditingController.text = days[selectedDurationIndex!];
    super.initState();
  }

  @override
  void dispose() {
    _amountEditingController.dispose();
    dayEditingController.dispose();
    super.dispose();
  }

  String calculatorPrice(String value){
    String price = '';
    if(swapText){
      price = "${double.parse(value)/widget.priceUsd}";
    }else{
      price = "${double.parse(value)*widget.priceUsd}";
    }
    return price;
  }

  void currentRatesCalculator(String quantity){
    if(quantity.isNotEmpty){
      if(!swapText){
        setState((){
          amountPrice = "${double.parse(quantity)/(double.parse(widget.apr!)*double.parse(dayEditingController.text.isNotEmpty ? dayEditingController.text : "0" ))}";
          _amountEditingController.text = "${double.parse(amountPrice)/widget.priceUsd}";
        });
      }else{
        setState((){
          _amountEditingController.text = "${double.parse(quantity)/(double.parse(widget.apr!)*double.parse(dayEditingController.text.isNotEmpty ? dayEditingController.text : "0" ))}";
          amountPrice = "${double.parse(_amountEditingController.text)/widget.priceUsd}";
        });
      }
    }else {
      setState((){
        amountPrice = '';
        _amountEditingController.text  = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFCard(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SFTextField(
                              controller: _amountEditingController,
                              showLabel: false,
                              noBorder: true,
                              readonly: widget.readonly,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .allow(RegExp(
                                    r'^\d{1,}[.,]?\d{0,6}')),
                              ],
                              textAlign: TextAlign.end,
                              onChanged: (value){
                                if(value.isNotEmpty){
                                  setState((){
                                    amountPrice = calculatorPrice(value);
                                    widget.staked(StakedArguments(day: int.parse(dayEditingController.text), amount: double.parse(amountPrice)));
                                  });
                                }else {
                                  setState((){
                                    amountPrice = '';
                                    widget.staked(StakedArguments(day: int.parse(dayEditingController.text), amount: 0));
                                  });
                                }
                              },
                              textInputType:
                              const TextInputType.numberWithOptions(
                                  decimal: true),
                              textStyle: TextStyles.bold16LightWhite,
                              hintText: '0.00',
                              hintStyle: TextStyles.bold16LightWhite,
                            ),
                          ),
                          SFText(keyText: swapText ? " USD" : " SLFT", style: TextStyles.bold16LightWhite,),
                        ],
                      ),

                      const SizedBox(
                        height: 12.0,
                      ),
                      SFText(
                        keyText: "${amountPrice.isEmpty ? 0 : amountPrice} ${swapText ? " SLFT" : " USD"}",
                        style: TextStyles.lightGrey14,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    String temp = '';
                    setState(() {
                      swapText = !swapText;
                      temp = amountPrice;
                      amountPrice = _amountEditingController.text;
                      _amountEditingController.text = temp;
                      widget.staked(StakedArguments(day: int.parse(dayEditingController.text),
                          amount: (amountPrice.isNotEmpty && _amountEditingController.text.isNotEmpty)
                              ? double.parse(!swapText ? amountPrice : _amountEditingController.text)
                              : 0));
                    });
                  },
                  child: const Icon(
                    Icons.swap_vert,
                    color: AppColors.blue,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: List.generate(
              balance.length,
                  (index) => GestureDetector(
                onTap: () {
                  if (selectedIndex == index) {
                    setState(() {
                      selectedIndex = null;
                      amountPrice = '';
                      _amountEditingController.text = '';
                      widget.staked(StakedArguments(day: int.parse(dayEditingController.text), amount: 0));
                    });
                  } else {
                    setState(() {
                      selectedIndex = index;
                      if(index != 2){
                        amountPrice = balance.elementAt(index);
                        _amountEditingController.text = "${double.parse(balance.elementAt(index))/widget.priceUsd}";
                        widget.staked(StakedArguments(day: int.parse(dayEditingController.text), amount: double.parse(amountPrice)));
                      }else {
                        amountPrice = '';
                        _amountEditingController.text = '';
                        widget.staked(StakedArguments(day: int.parse(dayEditingController.text), amount: 0));
                      }
                    });
                  }
                },
                child: SFChip(
                  text: index + 1 == balance.length
                      ? balance[index]
                      : "\$${balance[index]}",
                  textStyle: selectedIndex == index
                      ? TextStyles.white14W700
                      : TextStyles.lightGrey14,
                  color: selectedIndex == index
                      ? AppColors.blue
                      : AppColors.white.withOpacity(0.05),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32,),
          SFText(
            keyText: LocaleKeys.add_duration,
            style: TextStyles.lightGrey14,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: List.generate(
              days.length,
                  (index) => GestureDetector(
                onTap: () {
                  if (selectedDurationIndex == index) {
                    setState(() {
                      selectedDurationIndex = null;
                      dayEditingController.text = '0';
                      widget.staked(StakedArguments(day: int.parse(dayEditingController.text), amount: 0));

                    });
                  } else {
                    setState(() {
                      selectedDurationIndex = index;
                      dayEditingController.text = days[index];
                      widget.staked(StakedArguments(day: int.parse(dayEditingController.text), amount: double.parse(amountPrice.isNotEmpty ? amountPrice : "0")));
                    });
                  }
                },
                child: SFChip(
                  text: "${days[index]}D",
                  textStyle: selectedDurationIndex == index
                      ? TextStyles.white14W700
                      : TextStyles.lightGrey14,
                  color: selectedDurationIndex == index
                      ? AppColors.blue
                      : AppColors.white.withOpacity(0.05),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          SFTextFieldTextButton(
            showLabel: false,
            controller: dayEditingController,
            textInputType: TextInputType.number,
            valueChanged: (value) {
              if (selectedDurationIndex != null && value != days[selectedDurationIndex!]) {
                setState(() {
                  selectedDurationIndex = null;
                });
              }
              widget.staked(StakedArguments(day: int.parse(value), amount: double.parse(amountPrice)));
            },
            textButton: LocaleKeys.day,
            textButtonStyle: TextStyles.lightGrey14,
          ),
        ],
      ),
    );
  }
}
