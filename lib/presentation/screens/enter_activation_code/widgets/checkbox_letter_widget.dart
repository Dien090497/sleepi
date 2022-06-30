import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class CheckBoxLetterWidget extends StatefulWidget {
  const CheckBoxLetterWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxLetterWidget> createState() => _CheckBoxLetterWidgetState();
}

class _CheckBoxLetterWidgetState extends State<CheckBoxLetterWidget> {
  bool? value = true;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
            side: MaterialStateBorderSide.resolveWith((states) {
              if(states.contains(MaterialState.pressed)){
                return const BorderSide(color: AppColors.lightGrey, width: 1.5);
              }
              else{
                return const BorderSide(color: AppColors.lightGrey, width: 1.5);
              }
            }),
            checkColor: AppColors.green,
            fillColor: MaterialStateProperty.all(Colors.transparent),
            value: value,
            onChanged: (v) {
              setState(() {
                value = v;
              });
            },
          ),
        ),
        const SizedBox(width: 4,),
        SFText(keyText: LocaleKeys.receive_news_letters, style: TextStyles.w400lightGrey12,),
      ],
    );
  }
}
