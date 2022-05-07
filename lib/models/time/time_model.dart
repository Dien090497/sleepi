import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_model.g.dart';

@JsonSerializable()
class TimeModel {
  TimeModel({
    required this.abbreviation,
    required this.clientIp,
    required this.datetime,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.dst,
    this.dstFrom,
    required this.dstOffset,
    this.dstUntil,
    required this.rawOffset,
    required this.timezone,
    required this.unixtime,
    required this.utcDateTime,
    required this.utcOffset,
    required this.weekNumber,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) =>
      _$TimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeModelToJson(this);

  final String abbreviation;

  @JsonKey(name: 'client_ip')
  final String clientIp;

  final DateTime datetime;

  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;

  @JsonKey(name: 'day_of_year')
  final int dayOfYear;

  final bool dst;

  @JsonKey(name: 'dst_from')
  final String? dstFrom;

  @JsonKey(name: 'dst_offset')
  final int dstOffset;

  @JsonKey(name: 'dst_until')
  final String? dstUntil;

  @JsonKey(name: 'raw_offset')
  final int rawOffset;

  final String timezone;

  final int unixtime;

  @JsonKey(name: 'utc_datetime')
  final String utcDateTime;

  @JsonKey(name: 'utc_offset')
  final String utcOffset;

  @JsonKey(name: 'week_number')
  final int weekNumber;
}
