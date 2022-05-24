import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ModalPopUpLanguage extends StatelessWidget {
  const ModalPopUpLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <Widget> language = [
      SFText(keyText: Keys.japanese, style: TextStyles.bold16LightWhite,),
      SFText(keyText: Keys.english, style: TextStyles.bold16LightWhite),
      SFText(keyText: Keys.chinese, style: TextStyles.bold16LightWhite),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CupertinoPicker(
            onSelectedItemChanged: (value){
            },
            itemExtent: 25,
            diameterRatio:1,
            useMagnifier: true,
            magnification: 1.3,
            children: language,
          ),
        ),
        SFButton(text: Keys.done, color: AppColors.white, onPressed: () => Navigator.pop(context))
      ],
    );
  }
}
