import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ChanceWidget extends StatelessWidget {
  const ChanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(alignment: Alignment.centerLeft, children: [
            SFPercentBorderGradient(
              valueActive: 150,
              totalValue: 500,
              linearGradient: AppColors.gradientBlueButton,
              lineHeight: 18,
              barRadius: 20,
              backgroundColor: Colors.white.withOpacity(0.05),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SFText(
                keyText: '30/100',
                style: TextStyles.white10,
              ),
            )
          ]),
        ),
        const SizedBox(width: 16,),
        SFButton(
          height: 32,
          text: LocaleKeys.get,
          textStyle: TextStyles.boldWhite14,
          gradient: AppColors.gradientGacha,

          onPressed: () {
            Navigator.pushNamed(context, R.gacha500TimesChance);
          },
        ),
      ],
    );
  }
}
