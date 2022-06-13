import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

import 'custom_radio_button.dart';

class OptionBeds extends StatefulWidget {
  const OptionBeds({Key? key}) : super(key: key);

  @override
  State<OptionBeds> createState() => _OptionBedsState();
}

class _OptionBedsState extends State<OptionBeds> {
  int selectedIndex = 0;
  List<String> optionList = [LocaleKeys.short_bed, LocaleKeys.middle_bed, LocaleKeys.long_bed];
  @override
  Widget build(BuildContext context) {
    return Row(
      children:  List.generate(optionList.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState((){
                selectedIndex = index;
              });
            },
              child: Option(
                  title: optionList.elementAt(index),
                  textStyle: selectedIndex == index ? TextStyles.blue12W700 : null,
                  value: selectedIndex,
                  groupValue: index,
              )
          ),
        );
      }),
    );
  }
}

class Option extends StatelessWidget {
  const Option({required this.title, this.textStyle, this.color, required this.value, required this.groupValue, Key? key}) : super(key: key);

  final String title;
  final Color? color;
  final TextStyle? textStyle;
  final int groupValue;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(10),
            color:  AppColors.white
                .withOpacity(0.1)),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 3, right: 8),
                child: CustomRadio(
                  value: value,
                  groupValue: groupValue,
                  onChanged: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10),
              child: Center(
                  child: SFText(
                    keyText: title,
                    style: textStyle ?? TextStyles.lightGrey12W700,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

