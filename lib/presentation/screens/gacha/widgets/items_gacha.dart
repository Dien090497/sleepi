import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/chance_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/decorated_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/gacha_roll_selections.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/probability_widget.dart';

class ItemsGacha extends StatelessWidget {
  const ItemsGacha({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DecoratedWidget(
                child: SFText(keyText: title, style: TextStyles.bold18White)),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: SFText(
                  keyText: LocaleKeys.probability, style: TextStyles.white14),
            )
          ],
        ),
        const SizedBox(height: 17),
        const ProbabilityWidget(),
        const SizedBox(height: 20),
        const GachaRollSelections(),
        const SizedBox(height: 13),
        SFText(
            keyText: LocaleKeys.uncommon_beds_chance,
            style: TextStyles.lightGrey12),
        const SizedBox(height: 2),
        const ChanceWidget(),
        const SizedBox(height: 28),
      ],
    );
  }
}
