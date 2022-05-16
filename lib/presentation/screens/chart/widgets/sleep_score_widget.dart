import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class SleepScore extends StatelessWidget {
  const SleepScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.greyBottomNavBar,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: const [
          _Row(title: Keys.bedTime, result: '2:11'),
          _Row(title: Keys.sleepOnsetTime, result: '3:08'),
          _Row(title: Keys.wokeUp, result: '10:04'),
          _Row(title: Keys.sleepDuration, result: '7h 52m 54s'),
          _Row(title: Keys.nocturnalAwakening, result: '2'),
          _Row(title: Keys.sleepScore, result: '85.6%'),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({Key? key, required this.title, required this.result})
      : super(key: key);

  final String title;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: SFText(keyText: title),
        ),
        SFText(keyText: ':'),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: SFText(keyText: result, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
