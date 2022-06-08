import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_entity.freezed.dart';

@freezed
class TimeEntity with _$TimeEntity {
  const factory TimeEntity({
    required String abbreviation,
    required String clientIp,
    required String dateTime,
    required int dayOfWeek,
    required int dayOfYear,
    required bool dst,
    String? dstFrom,
    required int dstOffset,
    String? dstUntil,
    required int rawOffset,
    required String timezone,
    required int unixtime,
    required String utcDateTime,
    required String utcOffset,
    required int weekNumber,
  }) = _TimeEntity;
}
