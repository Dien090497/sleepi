import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';


class ModalPopUpBirthYear extends StatelessWidget {
  const ModalPopUpBirthYear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _range(int from, int to) => List.generate(to - from + 1, (i) => i + from);
    List years = _range(1900, DateTime.now().year);

    return Container(
        height: MediaQuery.of(context).copyWith().size.height*0.3,
        color: AppColors.white,
        child: Column(
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
                children: List.generate(years.length, (i) => SFText(keyText: years[i].toString())).toList(),
              ),
            ),
            SFButton(text: Keys.done, color: AppColors.white, onPressed: () => Navigator.pop(context))
          ],
        )
    );
  }
}
