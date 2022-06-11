import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class GachaRollSelections extends StatelessWidget {
  const GachaRollSelections({
    Key? key,
    required this.singleGacha,
    required this.timesGacha,
  }) : super(key: key);

  final int singleGacha;
  final int timesGacha;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, R.gachaResultBed);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SFText(
                    keyText: '$singleGacha SLFT',
                    style: TextStyles.boldWhite18,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SFText(
                    keyText: LocaleKeys.single_gacha,
                    style: TextStyles.white14WithOpacity,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 35),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, R.allResult);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SFText(
                      keyText: '$timesGacha SLFT',
                      style: TextStyles.boldWhite18),
                  const SizedBox(
                    height: 5,
                  ),
                  SFText(
                    keyText:
                        LocaleKeys.ten_times_gacha.tr(namedArgs: {'num': '10'}),
                    style: TextStyles.white14WithOpacity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
