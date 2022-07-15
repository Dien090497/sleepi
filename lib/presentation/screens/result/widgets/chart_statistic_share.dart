import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/entities/draw_chart_entity/draw_chart_entity.dart';

class ChartStatisticShare extends StatelessWidget {
  const ChartStatisticShare({Key? key, this.titleBottom = true, this.data, required this.maxValue}) : super(key: key);

  final DrawChartEntity? data;
  final bool titleBottom;
  final int maxValue;


  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (value == 0) {
      return const Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Text('0',
            textAlign: TextAlign.right, style: TextStyles.lightGrey12),
      );
    }
    if (maxValue <= 100) {
      if (value % 20 == 0 && value != 0) {
        return Text( value.toString(), style: TextStyles.lightGrey12);
      } else {
        return const SizedBox();
      }
    } else {
      if (value % 60 == 0 && value != 0) {
        return Text( value.toString(), style: TextStyles.lightGrey12);
      } else {
        return const SizedBox();
      }
    }
    /*Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Text('0',
              textAlign: TextAlign.right, style: TextStyles.lightGrey12),
        );
        break;
      case 5:
        text = const Text('04:00', style: TextStyles.lightGrey12);
        break;
      case 10:
        text = const Text('04:30', style: TextStyles.lightGrey12);
        break;
      case 15:
        text = const Text('05:00', style: TextStyles.lightGrey12);
        break;
      case 20:
        text = const Text('05:30', style: TextStyles.lightGrey12);
        break;
      case 25:
        text = const Text('06:00', style: TextStyles.lightGrey12);
        break;
      default:
        text = const Text('', style: TextStyles.lightGrey12);
        break;
    }
    return text;*/
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (value % 2 == 0 && value != 0) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(data?.listData[value.toInt()].x ?? '', style: TextStyles.lightGrey12),
      );
    } else {
      return const SizedBox();
    }
    /*Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('2021-01', style: TextStyles.lightGrey12);
        break;
      case 10:
        text = const Text('2021-06', style: TextStyles.lightGrey12);
        break;
      case 20:
        text = const Text('2021-12', style: TextStyles.lightGrey12);
        break;
      default:
        text = const Text('', style: TextStyles.lightGrey12);
        break;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: text,
    );*/
  }

  LineChartData mainData() {

    List<Color> gradientColors = [
      AppColors.blue,
      AppColors.blue,
    ];
    List<Color> gradientColorsArea = [
      AppColors.blue.withOpacity(0.35),
      AppColors.blue.withOpacity(0.15),
      AppColors.blue.withOpacity(0),
    ];
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: titleBottom,
            reservedSize: 20,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
              bottom: BorderSide(
            color: AppColors.lightGrey,
            width: 1,
          ))),
      minX: 0,
      maxX: data?.maxX,
      minY: 0,
      maxY: data?.maxy,
      lineBarsData: [
        LineChartBarData(
          spots: data?.listFlSpot,
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColorsArea,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Container(
        padding: const EdgeInsets.all(20),
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }
}
