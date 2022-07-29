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
  const ItemsGacha({Key? key,
    required this.dialogData,
    required this.costSingle,
    required this.costMultiple,
    required this.title,
    required this.singleGachaImages,
    required this.timesGachaImages,
    required this.singleProbability,
    required this.timesProbability,
    required this.numberOfSpin,
    required this.totalValue,
    required this.typeReward,
    required this.imagePath,
    required this.onPressed,
    required this.normalGacha,
  })
      : super(key: key);

  final List<dynamic>? dialogData;
  final String title;
  final String typeReward;
  final String singleGachaImages;
  final String timesGachaImages;
  final int singleProbability;
  final int timesProbability;
  final int numberOfSpin;
  final int totalValue;
  final int costSingle;
  final int costMultiple;
  final String imagePath;
  final bool normalGacha;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DecoratedWidget(
                child: SFText(keyText: title, style: TextStyles.bold18White)),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showCustomAlertDialog(context,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.9,
                    children: ProbabilityDialog(normalGacha: normalGacha, dialogData: dialogData,));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: SFText(
                    keyText: LocaleKeys.probability,
                    style: TextStyles.white14),
              ),
            )
          ],
        ),
        const SizedBox(height: 17),
        ProbabilityWidget(imagePath: imagePath, normalGacha: normalGacha, dialogData: dialogData),
        const SizedBox(height: 20),
        GachaRollSelections(
          singleGachaImages: singleGachaImages,
          timesGachaImages: timesGachaImages,
          singleProbability: singleProbability,
          timesProbability: timesProbability,
          costSingle: costSingle,
          costMultiple: costMultiple,
          normalGacha: normalGacha,
          onPressed: onPressed,
        ),
        const SizedBox(height: 16),
        SFText(
            keyText: typeReward,
            style: TextStyles.lightGrey12),
        const SizedBox(height: 2),
        ChanceWidget(numberOfSpin: numberOfSpin, normalGacha: normalGacha, totalValue: totalValue, onPressed: onPressed,),
        const SizedBox(height: 28),
      ],
    );
  }
}
