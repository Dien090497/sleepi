import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class ChartStatistic extends StatelessWidget {
  ChartStatistic({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    AppColors.blue,
    AppColors.blue,
  ];
  final List<Color> gradientColorsArea = [
    AppColors.bluesDark.withOpacity(0.05),
    AppColors.bluesDark.withOpacity(0.05),
  ];

  Widget topTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('1h', style: TextStyles.lightGrey12);
        break;
      case 3:
        text = const Text('24h', style: TextStyles.lightGrey12);
        break;
      case 5:
        text = const Text('1w', style: TextStyles.lightGrey12);
        break;
      case 7:
        text = const Text('1m', style: TextStyles.lightGrey12);
        break;
      case 9:
        text = const Text('3m', style: TextStyles.lightGrey12);
        break;
      case 11:
        text = const Text('1y', style: TextStyles.lightGrey12);
        break;
      case 13:
        text = const Text('All time', style: TextStyles.lightGrey12);
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
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 0,
          );
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
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            // reservedSize: 30,
            interval: 1,
            getTitlesWidget: topTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 14.5,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 2),
            FlSpot(1, 3),
            FlSpot(2, 1),
            FlSpot(3, 3.5),
            FlSpot(4, 3.4),
            FlSpot(5, 3),
            FlSpot(6, 4),
            FlSpot(7, 3.5),
            FlSpot(9, 4),
            FlSpot(11, 5),
            FlSpot(14.5, 4.5),
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
              colors: gradientColorsArea
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
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
        padding: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: LineChart(
            mainData(),
          ),
        ),
      ),
    );
  }
}
