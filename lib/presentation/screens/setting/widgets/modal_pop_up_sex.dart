import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ModalPopUpSex extends StatelessWidget {
  const ModalPopUpSex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> gender = [
      SFText(
        keyText: LocaleKeys.secret,
        style: TextStyles.bold16LightWhite,
      ),
      SFText(keyText: LocaleKeys.secret, style: TextStyles.bold16LightWhite),
      SFText(keyText: LocaleKeys.secret, style: TextStyles.bold16LightWhite),
      SFText(keyText: LocaleKeys.secret, style: TextStyles.bold16LightWhite),
    ];

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoPicker(
              onSelectedItemChanged: (value) {},
              itemExtent: 25,
              diameterRatio: 1,
              useMagnifier: true,
              magnification: 1.3,
              children: gender,
            ),
          ),
          SFButton(
              text: LocaleKeys.done,
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              height: 48,
              onPressed: () => Navigator.pop(context))
        ],
      ),
    );
  }
}
