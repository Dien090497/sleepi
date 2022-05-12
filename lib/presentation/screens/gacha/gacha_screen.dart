import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/chance_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/decorated_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/gacha_roll_selections.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/probability_widget.dart';

class GachaScreen extends StatelessWidget {
  const GachaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBarCommon(),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                children: [
                  DecoratedWidget(
                    padding: const EdgeInsets.fromLTRB(56, 16, 56, 8),
                    width: 262,
                    child: SFText(keyText: Keys.normalGacha),
                  ),
                  const SizedBox(height: 17),
                  const ProbabilityWidget(),
                  const SizedBox(height: 6),
                  const GachaRollSelections(),
                  const SizedBox(height: 13),
                  SFText(keyText: Keys.uncommonBedsChance),
                  const SizedBox(height: 2),
                  const ChanceWidget(),
                  const SizedBox(height: 28),
                  const ProbabilityWidget(),
                  const SizedBox(height: 6),
                  const GachaRollSelections(),
                  const SizedBox(height: 13),
                  SFText(keyText: Keys.rareBedsChance),
                  const SizedBox(height: 2),
                  const ChanceWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
