import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class OptionBeds extends StatefulWidget {
  const OptionBeds({required this.type, Key? key}) : super(key: key);
  final String? type;

  @override
  State<OptionBeds> createState() => _OptionBedsState();
}

class _OptionBedsState extends State<OptionBeds> {
  int selectedIndex = 0;
  int? bedIndex;
  List<String> bedTypes = ['short', 'middle', 'long', 'flexible'];
  List<String> optionList = [LocaleKeys.short_bed, LocaleKeys.middle_bed, LocaleKeys.long_bed, LocaleKeys.flexible_bed];

  @override
  Widget build(BuildContext context) {
    if(widget.type != null ){
      bedIndex =  bedTypes.indexWhere((type) => type == widget.type);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  textStyle: index == bedIndex ? TextStyles.blue12W700 : null,
                  value: bedIndex != null ? bedIndex! : index,
                  groupValue: index,
              )
          ),
        );
      }),
    );
  }
}

class Option extends StatelessWidget {
  const Option({required this.title, this.textStyle, this.color,required this.groupValue,  required this.value, Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(10),
            color:  AppColors.white
                .withOpacity(0.1)),
        child: Center(
            child: SFText(
              keyText: title,
              style: textStyle ?? TextStyles.lightGrey12W700,
              textAlign: TextAlign.center,
            )),

        // Column(
        //   children: [
            // const SizedBox(
            //   height: 5,
            // ),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: CustomRadio(
            //     value: value,
            //     groupValue: groupValue,
            //   ),
            // ),
        //
        //   ],
        // ),
      ),
    );
  }
}

