import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_draw_days.g.dart';

@JsonSerializable()
class ChartDrawDays {
  final int t;
  final int v;
  final int s;
  final String type;

  ChartDrawDays({
    required this.t,
    required this.v,
    required this.s,
    required this.type,
  });

  factory ChartDrawDays.fromJson(Map<String, dynamic> json) =>
      _$ChartDrawDaysFromJson(json);

  Map<String, dynamic> toJson() => _$ChartDrawDaysToJson(this);
}
