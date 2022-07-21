import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/chance_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/decorated_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/gacha_roll_selections.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/probability_dialog.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/probability_widget.dart';

class ItemsGacha extends StatelessWidget {
  const ItemsGacha(
      {Key? key,
        required this.title,
        required this.singleGachaImages,
        required this.timesGachaImages,
        required this.singleProbability,
        required this.timesProbability,
        required this.typeReward,
        required this.imagePath,
        this.normalGacha = true,
      })
      : super(key: key);

  final String title;
  final String typeReward;
  final String singleGachaImages;
  final String timesGachaImages;
  final int singleProbability;
  final int timesProbability;
  final String imagePath;
  final bool normalGacha;

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
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, R.probability);
                showCustomAlertDialog(context,
                    children: const ProbabilityDialog());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: SFText(
                    keyText: LocaleKeys.probability, style: TextStyles.white14),
              ),
            )
          ],
        ),
        const SizedBox(height: 17),
        ProbabilityWidget(imagePath: imagePath,),
        const SizedBox(height: 20),
        GachaRollSelections(
            singleGachaImages: singleGachaImages,
            timesGachaImages: timesGachaImages,
            singleProbability: singleProbability,
            timesProbability: timesProbability,
            normalGacha: normalGacha,
        ),
        const SizedBox(height: 16),
        SFText(
            keyText: typeReward,
            style: TextStyles.lightGrey12),
        const SizedBox(height: 2),
        const ChanceWidget(),
        const SizedBox(height: 28),
      ],
    );
  }
}
