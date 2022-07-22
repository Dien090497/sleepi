import 'package:json_annotation/json_annotation.dart';

part 'history_data.g.dart';

@JsonSerializable()
class HistoryData {
  final int? id;
  final int? userId;
  final int? specialTimes;
  final int? commonTimes;
  final String? createdAt;

  HistoryData({
    this.id,
    this.userId,
    this.specialTimes,
    this.commonTimes,
    this.createdAt,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) => _$HistoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDataToJson(this);

}
