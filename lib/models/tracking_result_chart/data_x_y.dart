import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_x_y.g.dart';

@JsonSerializable()
class DataXY {
  final int t;
  final int v;

  DataXY({required this.t, required this.v});

  factory DataXY.fromJson(Map<String, dynamic> json) =>
      _$DataXYFromJson(json);

  Map<String, dynamic> toJson() => _$DataXYToJson(this);
}
