import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ModalPopUpLanguage extends StatelessWidget {
  const ModalPopUpLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final langCodes = Const.locales.map<String>((e) => e.languageCode).toList();
    final currentLocale = context.locale;
    int selectedIndex = langCodes.indexOf(currentLocale.languageCode);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoPicker(
              onSelectedItemChanged: (index) {
                selectedIndex = index;
              },
              itemExtent: 30,
              scrollController:
                  FixedExtentScrollController(initialItem: selectedIndex),
              diameterRatio: 1,
              children: List.generate(Const.locales.length, (i) {
                return Center(
                    child: SFText(
                        keyText: Const.locales[i].displayName,
                        style: TextStyles.bold16LightWhite));
              }),
            ),
          ),
          SFButton(
              text: LocaleKeys.done,
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              height: 48,
              onPressed: () {
                Navigator.pop(context);
                context.setLocale(Const.locales[selectedIndex]);
              }),
          const SizedBox(
            height: 37,
          )
        ],
      ),
    );
  }
}
