import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/di/translations/keys.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(
            context: context,
            title: Keys.result,
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
                const SFLabelValue(label: Keys.bedTime, value: '23:30'),
                const SizedBox(
                  height: 8,
                ),
                const SFLabelValue(label: Keys.sleepOnsetTime, value: '00:30'),
                const SizedBox(
                  height: 8,
                ),
                const SFLabelValue(label: Keys.wokeUp, value: '08:30'),
                const SizedBox(
                  height: 8,
                ),
                const SFLabelValue(label: Keys.nocturnalAwakening, value: '1'),
                const SizedBox(
                  height: 8,
                ),
                const SFLabelValue(label: Keys.sleepDuration, value: '8h45min'),
                const SizedBox(
                  height: 8,
                ),
                const SFLabelValue(label: Keys.sleepQuality, value: '99/100'),
                const SizedBox(
                  height: 24,
                ),
                SFButton(
                  text: Keys.shareYourSleep,
                  gradient: AppColors.gradientBlueButton,
                  width: double.infinity,
                  height: 48,
                  onPressed: (){
                    Navigator.pushNamed(context, R.share);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
