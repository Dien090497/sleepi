import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class ChartStatisticShare extends StatelessWidget {
  ChartStatisticShare({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    AppColors.blue,
    AppColors.blue,
  ];
  final List<Color> gradientColorsArea = [
    AppColors.blue.withOpacity(0.35),
    AppColors.blue.withOpacity(0.15),
    AppColors.blue.withOpacity(0),
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    Widget text;
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
    return text;
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Text('0',
              textAlign: TextAlign.right, style: TextStyles.lightGrey12),
        );
        break;
      case 5:
        text = const Text('2021-01', style: TextStyles.lightGrey12);
        break;
      case 15:
        text = const Text('2021-06', style: TextStyles.lightGrey12);
        break;
      case 25:
        text = const Text('2021-12', style: TextStyles.lightGrey12);
        break;

      default:
        text = const Text('', style: TextStyles.lightGrey12);
        break;
    }
    return text;
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 5,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
              color: AppColors.lightGrey, strokeWidth: 0.5, dashArray: [2]);
        },
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
              showTitles: true,
            reservedSize: 40,
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
      maxX: 25,
      minY: 0,
      maxY: 26,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 5),
            FlSpot(5, 9),
            FlSpot(10, 9),
            FlSpot(15, 17),
            FlSpot(20, 14),
            FlSpot(25, 25),
          ],
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
