import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ModalPopUpSex extends StatelessWidget {
  const ModalPopUpSex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <Widget> gender = [
      SFText(keyText: Keys.female),
      SFText(keyText: Keys.male),
      SFText(keyText: Keys.other),
    ];

    return Container(
        height: MediaQuery.of(context).copyWith().size.height*0.25,
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CupertinoPicker(
                children: gender,
                onSelectedItemChanged: (value){
                },
                itemExtent: 25,
                diameterRatio:1,
                useMagnifier: true,
                magnification: 1.3,
              ),
            ),
             SFButton(text: Keys.done, color: AppColors.white, onPressed: () => Navigator.pop(context))
          ],
        )
    );
  }
}
