import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PopUpCompound extends StatelessWidget {
  const PopUpCompound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(keyText: "Do you really want to Compound XXXX SLFT?", style: TextStyles.w600LightWhiteSize16, textAlign: TextAlign.center,),
        const SizedBox(
          height: 32.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SFButton(
                text: Keys.yes,
                textStyle: TextStyles.bold14LightWhite,
                color: AppColors.blue,
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: SFButton(
                text: Keys.no,
                textStyle: TextStyles.w600LightGreySize16,
                color: AppColors.light4,
                onPressed: () => Navigator.maybePop(context),
              ),
            ),
          ],
        )
      ],
    );
  }
}
