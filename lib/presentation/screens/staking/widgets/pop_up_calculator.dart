import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_chip.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class PopUpCalculator extends StatelessWidget {
  const PopUpCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SFText(
          keyText: LocaleKeys.flexible,
          style: TextStyles.bold16Blue,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 12.0,
        ),
        SFText(
          keyText: LocaleKeys.slft_staked,
          style: TextStyles.lightGrey14,
        ),
        const SLFTStaked(),
        const SizedBox(
          height: 32.0,
        ),
        const AddDuration(),
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
          child: const RoiCurrentRates()
        ),
      ],
    );
  }
}

class RoiCurrentRates extends StatefulWidget {
  const RoiCurrentRates({Key? key}) : super(key: key);

  @override
  State<RoiCurrentRates> createState() => _RoiCurrentRatesState();
}

class _RoiCurrentRatesState extends State<RoiCurrentRates> {
  bool isChangedRates = true;


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Expanded(
            child:  Column(
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
                  showLabel: false,
                  noBorder: true,
                  readonly: isChangedRates,
                  textInputType: TextInputType.number,
                  textStyle: TextStyles.bold24LightWhite,
                  hintText: '0.00',
                  hintStyle: TextStyles.bold24LightWhite,
                ),

                const SizedBox(
                  height: 4,
                ),
                SFText(
                  keyText: "~ 0 SLFT (0.00%)",
                  style: TextStyles.lightGrey14,
                ),
              ],
            )),
        GestureDetector(
          onTap: () {
            setState((){
              isChangedRates = !isChangedRates;
            });
          },
          child: isChangedRates ? const SFIcon(
            Ics.icEdit,
            width: 28,
          ) : const Icon(Icons.check_circle_rounded, color: AppColors.lightWhite, size: 32,),
        ),
      ],
    );
  }
}


class AddDuration extends StatefulWidget {
  const AddDuration({Key? key}) : super(key: key);

  @override
  State<AddDuration> createState() => _AddDurationState();
}

class _AddDurationState extends State<AddDuration> {
  TextEditingController dayEditingController = TextEditingController();
  int? selectedIndex;

  List<String> days = ["1", "7", "30", "60", "180"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          children: List.generate(days.length, (index) =>  GestureDetector(
            onTap: (){
              if(selectedIndex == index){
                setState((){
                  selectedIndex = null;
                  dayEditingController.text = '';
                });
              }else{
                setState((){
                  selectedIndex = index;
                  dayEditingController.text = days[index];
                });
              }

            },
            child: SFChip(
              text: "${days[index]}D",
              textStyle: selectedIndex == index ? TextStyles.w700WhiteSize14 : TextStyles.w700LightGreySize14,
              color: selectedIndex == index ? AppColors.blue : AppColors.white.withOpacity(0.05),
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
          valueChanged: (value){
            if(selectedIndex != null && value != days[selectedIndex!]){
              setState((){
                selectedIndex = null;
              });
            }
          },
          textButton: LocaleKeys.day,
          textButtonStyle: TextStyles.lightGrey14,
        ),
      ],
    );
  }
}


class SLFTStaked extends StatefulWidget {
  const SLFTStaked({Key? key}) : super(key: key);

  @override
  State<SLFTStaked> createState() => _SLFTStakedState();
}

class _SLFTStakedState extends State<SLFTStaked> {
  bool swapText = false;
  int? selectedIndex;

  List<String> balance = ["100", "10000", "My Balance"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SFText(
                      keyText: swapText ? "${selectedIndex != null ? (selectedIndex! + 1 == balance.length ? 0 : balance[selectedIndex!]) : 0}.00 USD" : "0.00 SLFT",
                      style:TextStyles.lightWhite16,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SFText(
                      keyText: swapText ? "0.00 SLFT" : "${selectedIndex != null ? (selectedIndex! + 1 == balance.length ? 0 : balance[selectedIndex!]) : 0}.00 USD",
                      style: TextStyles.lightGrey12 ,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    swapText = !swapText;
                  });
                },
                child: const Icon(
                  Icons.swap_vert,
                  color: AppColors.blue,
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
          children: List.generate(balance.length, (index) =>  GestureDetector(
            onTap: (){
              if(selectedIndex == index){
                setState((){
                  selectedIndex = null;
                });
              }else{
                setState((){
                  selectedIndex = index;
                });
              }
            },
            child: SFChip(
              text: index + 1 == balance.length ? balance[index] : "\$${balance[index]}",
              textStyle: selectedIndex == index ? TextStyles.w700WhiteSize14 : TextStyles.w700LightGreySize14,
              color: selectedIndex == index ? AppColors.blue : AppColors.white.withOpacity(0.05),
            ),
          ),
          ),
        ),
      ],
    );
  }
}

