import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ModalPopUpLanguage extends StatelessWidget {
  const ModalPopUpLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> language = [
      SFText(
        keyText: LocaleKeys.japanese,
        style: TextStyles.bold16LightWhite,
      ),
      SFText(keyText: LocaleKeys.english, style: TextStyles.bold16LightWhite),
      SFText(keyText: LocaleKeys.chinese, style: TextStyles.bold16LightWhite),
    ];
    int middle = language.length ~/ 2;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoPicker(
              onSelectedItemChanged: (value) {},
              itemExtent: 30,
              scrollController: FixedExtentScrollController(initialItem: middle),
              diameterRatio: 1,
              children: language,
            ),
          ),
          SFButton(
              text: LocaleKeys.done,
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              height: 48,
              onPressed: () => Navigator.pop(context)),
          const SizedBox(height: 37,)
        ],
      ),
    );
  }
}
