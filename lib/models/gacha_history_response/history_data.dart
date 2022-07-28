import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_data.g.dart';

@JsonSerializable()
class HistoryData {
  final int? id;
  final int? userId;
  final int? specialTimes;
  final int? commonTimes;
  final int? totalCommonTimes;
  final int? totalSpecialTimes;
  final String? createdAt;

  HistoryData({
    this.id,
    this.userId,
    this.specialTimes,
    this.commonTimes,
    this.totalCommonTimes,
    this.totalSpecialTimes,
    this.createdAt,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) => _$HistoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDataToJson(this);

}
