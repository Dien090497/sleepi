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
      LocaleKeys.commonBed: 14,
      LocaleKeys.uncommonBed: 20,
      LocaleKeys.rareBed: 50,
      LocaleKeys.epicBed: 10,
      LocaleKeys.legendaryBed: 8,
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
            InfoChartColor(
              typeBed: LocaleKeys.commonBed,
              valueInChart: dataMap[LocaleKeys.commonBed]!.toStringAsFixed(0),
              color: colorList[0],
            ),
            InfoChartColor(
              typeBed: LocaleKeys.uncommonBed,
              valueInChart: dataMap[LocaleKeys.uncommonBed]!.toStringAsFixed(0),
              color: colorList[1],
            ),
            InfoChartColor(
              typeBed: LocaleKeys.rareBed,
              valueInChart: dataMap[LocaleKeys.rareBed]!.toStringAsFixed(0),
              color: colorList[2],
            ),
            InfoChartColor(
              typeBed: LocaleKeys.epicBed,
              valueInChart: dataMap[LocaleKeys.epicBed]!.toStringAsFixed(0),
              color: colorList[3],
            ),
            InfoChartColor(
              typeBed: LocaleKeys.legendaryBed,
              valueInChart:
                  dataMap[LocaleKeys.legendaryBed]!.toStringAsFixed(0),
              color: colorList[4],
            ),
          ],
        ),
      ),
    );
  }
}
