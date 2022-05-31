import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'dart:math' as math;
import 'package:slee_fi/di/translations/keys.dart';

import 'info_chart_color.dart';

class BedsProbability extends StatelessWidget {
  const BedsProbability({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final dataMap = <String, double>{
      Keys.commonBed: 35,
      Keys.uncommonBed: 15,
      Keys.rareBed: 22,
      Keys.epicBed: 20,
      Keys.legendaryBed: 8,
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
        showChartValues: false  ,
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
            const SizedBox(height: 30,),
            InfoChartColor(typeBed: Keys.commonBed, valueInChart: dataMap[Keys.commonBed]!.toStringAsFixed(0), color: colorList[0],),
            InfoChartColor(typeBed: Keys.uncommonBed, valueInChart: dataMap[Keys.uncommonBed]!.toStringAsFixed(0), color: colorList[1],),
            InfoChartColor(typeBed: Keys.rareBed, valueInChart: dataMap[Keys.rareBed]!.toStringAsFixed(0), color: colorList[2],),
            InfoChartColor(typeBed: Keys.epicBed, valueInChart: dataMap[Keys.epicBed]!.toStringAsFixed(0), color: colorList[3],),
            InfoChartColor(typeBed: Keys.legendaryBed, valueInChart: dataMap[Keys.legendaryBed]!.toStringAsFixed(0), color: colorList[4],),
          ],
        ),
      ),
    );
  }
}
