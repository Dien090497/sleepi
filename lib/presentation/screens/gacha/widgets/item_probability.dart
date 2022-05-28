import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/info_chart_color.dart';
import 'dart:math' as math;

class ItemProbability extends StatelessWidget {
  const ItemProbability({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final dataMap = <String, double>{
      Keys.commonBed: 23,
      Keys.uncommonBed: 32,
      Keys.rareBed: 12,
      Keys.epicBed: 10,
      Keys.legendaryBed: 28,
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
    );
  }
}
