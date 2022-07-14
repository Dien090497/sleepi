import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/common/enum/enum.dart';

part 'draw_chart_entity.freezed.dart';

@freezed
class DrawChartEntity with _$DrawChartEntity{

  const factory DrawChartEntity({
    required double maxX,
    required double maxy,
    required List<FlSpot> listFlSpot,
    required TypeChart typeChart
  })= _DrawChartEntity;
}