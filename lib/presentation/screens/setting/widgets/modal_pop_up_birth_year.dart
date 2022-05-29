import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ModalPopUpBirthYear extends StatelessWidget {
  const ModalPopUpBirthYear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _range(int from, int to) =>
        List.generate(to - from + 1, (i) => i + from);
    List years = _range(1900, DateTime.now().year);

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
              children: List.generate(
                  years.length,
                  (i) => SFText(
                        keyText: years[i].toString(),
                        style: TextStyles.bold16LightWhite,
                      )).toList(),
            ),
          ),
          SFButton(
              text: Keys.done,
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
