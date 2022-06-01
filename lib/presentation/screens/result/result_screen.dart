import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/result/widgets/chart_statistic.dart';

import 'widgets/category_header.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            appBar: SFAppBar(
              context: context,
              title: LocaleKeys.result,
              textStyle: TextStyles.bold18LightWhite,
            ),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const CategoryHeader(
                    earning: 1000,
                    score: 99,
                    sleepDuration: '7h35min',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ChartStatistic(),
                  const SizedBox(
                    height: 24,
                  ),
                  const SFLabelValue(label: LocaleKeys.bed_time, value: '23:30'),
                  const SizedBox(
                    height: 8,
                  ),
                  const SFLabelValue(
                      label: LocaleKeys.sleep_onset_time, value: '00:30'),
                  const SizedBox(
                    height: 8,
                  ),
                  const SFLabelValue(label: LocaleKeys.woke_up, value: '08:30'),
                  const SizedBox(
                    height: 8,
                  ),
                  const SFLabelValue(
                      label: LocaleKeys.nocturnal_awakenings, value: '1'),
                  const SizedBox(
                    height: 8,
                  ),
                  const SFLabelValue(
                      label: LocaleKeys.sleep_duration, value: '8h45min'),
                  const SizedBox(
                    height: 8,
                  ),
                  const SFLabelValue(
                      label: LocaleKeys.sleep_quality, value: '99/100'),
                  const SizedBox(
                    height: 92,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: SFButton(
            text: LocaleKeys.share_your_sleep,
            textStyle: TextStyles.white16,
            gradient: AppColors.gradientBlueButton,
            width: double.infinity,
            height: 48,
            onPressed: () {
              Navigator.pushNamed(context, R.share);
            },
          ),
        ),
      ],
    ));
  }
}
