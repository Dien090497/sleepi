import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class GachaRollSelections extends StatelessWidget {
  const GachaRollSelections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
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
                  keyText: '12 SLFT',
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
        const SizedBox(width: 35),
        Expanded(
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
                SFText(keyText: '100 SLFT', style: TextStyles.boldWhite18),
                const SizedBox(
                  height: 5,
                ),
                SFText(
                  keyText: LocaleKeys.times_gacha,
                  args: const {'num': '10'},
                  style: TextStyles.white14WithOpacity,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
