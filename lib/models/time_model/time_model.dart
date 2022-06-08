import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/time_entity/time_entity.dart';

part 'time_model.g.dart';

@JsonSerializable()
class TimeModel implements TimeEntity {
  @JsonKey(name: 'abbreviation')
  @override
  final String abbreviation;

  @JsonKey(name: 'client_ip')
  @override
  final String clientIp;

  @JsonKey(name: 'datetime')
  @override
  final String dateTime;

  @JsonKey(name: 'day_of_week')
  @override
  final int dayOfWeek;

  @JsonKey(name: 'day_of_year')
  @override
  final int dayOfYear;

  @JsonKey(name: 'dst')
  @override
  final bool dst;

  @JsonKey(name: 'dst_from')
  @override
  final String? dstFrom;

  @JsonKey(name: 'dst_offset')
  @override
  final int dstOffset;

  @JsonKey(name: 'dst_until')
  @override
  final String? dstUntil;

  @JsonKey(name: 'raw_offset')
  @override
  final int rawOffset;

  @JsonKey(name: 'timezone')
  @override
  final String timezone;

  @JsonKey(name: 'unixtime')
  @override
  final int unixtime;

  @JsonKey(name: 'utc_datetime')
  @override
  final String utcDateTime;

  @JsonKey(name: 'utc_offset')
  @override
  final String utcOffset;

  @JsonKey(name: 'week_number')
  @override
  final int weekNumber;

  const TimeModel({
    required this.abbreviation,
    required this.clientIp,
    required this.dateTime,
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

  @override
  $TimeEntityCopyWith<TimeEntity> get copyWith => throw UnimplementedError();
}
