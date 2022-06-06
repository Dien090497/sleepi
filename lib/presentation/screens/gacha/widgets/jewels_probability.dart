import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/info_chart_color.dart';

class JewelsProbability extends StatelessWidget {
  const JewelsProbability({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final dataMap = <String, double>{
      LocaleKeys.common_bed: 14,
      LocaleKeys.uncommon_bed: 20,
      LocaleKeys.rare_bed: 50,
      LocaleKeys.epic_bed: 10,
      LocaleKeys.legendary_bed: 8,
    };
    final colorList = <Color>[
      AppColors.commonBed,
      AppColors.uncommonBed,
      AppColors.rareBed,
      AppColors.epicBed,
      AppColors.legendaryBed,
    ];
    int key = 0;
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: math.min(MediaQuery.of(context).size.width / 2, 300),
      colorList: colorList,
      legendOptions: const LegendOptions(
        showLegends: false,
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: false,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: size.width,
              decoration: BoxDecoration(
                color: AppColors.whiteOpacity5,
                borderRadius: BorderRadius.circular(10),
              ),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return chart;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: InfoChartColor(
                    typeBed: LocaleKeys.common_bed,
                    valueInChart: dataMap[LocaleKeys.common_bed]!.toStringAsFixed(0),
                    color: colorList[0],
                  ),
                ),
                Expanded(
                  child: InfoChartColor(
                    typeBed: LocaleKeys.uncommon_bed,
                    valueInChart: dataMap[LocaleKeys.uncommon_bed]!.toStringAsFixed(0),
                    color: colorList[1],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: InfoChartColor(
                    typeBed: LocaleKeys.rare_bed,
                    valueInChart: dataMap[LocaleKeys.rare_bed]!.toStringAsFixed(0),
                    color: colorList[2],
                  ),
                ),
                Expanded(
                  child: InfoChartColor(
                    typeBed: LocaleKeys.epic_bed,
                    valueInChart: dataMap[LocaleKeys.epic_bed]!.toStringAsFixed(0),
                    color: colorList[3],
                  ),
                ),
              ],
            ),
            InfoChartColor(
              typeBed: LocaleKeys.legendary_bed,
              valueInChart:
              dataMap[LocaleKeys.legendary_bed]!.toStringAsFixed(0),
              color: colorList[4],
            ),
          ],
        ),
      ),
    );
  }
}
