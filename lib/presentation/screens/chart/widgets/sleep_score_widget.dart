import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
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
          const ChartTitle(
            title: LocaleKeys.bedTime,
            result: "2:11",
          ),
          divider,
          const ChartTitle(
            title: LocaleKeys.sleepOnsetTime,
            result: "3:11",
          ),
          divider,
          const ChartTitle(
            title: LocaleKeys.wokeUp,
            result: "10:04",
          ),
          divider,
          const ChartTitle(
            title: LocaleKeys.timeInBed,
            result: "7h52m54s",
          ),
          divider,
          const ChartTitle(
            title: LocaleKeys.sleepDuration,
            result: "6h52m54s",
          ),
          divider,
          const ChartTitle(
            title: LocaleKeys.nocturnalAwakening,
            result: "2",
          ),
          divider,
          const ChartTitle(
            title: LocaleKeys.sleepScore,
            result: "85,6%",
          ),
        ],
      ),
    );
  }
}
