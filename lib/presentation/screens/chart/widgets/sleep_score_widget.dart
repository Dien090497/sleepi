import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_title.dart';

class SleepScore extends StatelessWidget {
  const SleepScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Divider divider = Divider(
      color: AppColors.lightWhite.withOpacity(0.05),
      height: 1,
    );
    return SFCard(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const ChartTitle(title: Keys.bedTime, result: "2:11",),
          divider,
          const ChartTitle(title: Keys.sleepOnsetTime, result: "3:11",),
          divider,
          const ChartTitle(title: Keys.wokeUp, result: "10:04",),
          divider,
          const ChartTitle(title: Keys.timeInBed, result: "7h52m54s",),
          divider,
          const ChartTitle(title: Keys.sleepDuration, result: "6h52m54s",),
          divider,
          const ChartTitle(title: Keys.nocturnalAwakening, result: "2",),
          divider,
          const ChartTitle(title: Keys.sleepScore, result: "85,6%",),
        ],
      ),
    );
  }
}