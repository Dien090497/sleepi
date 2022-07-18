import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_of_owner_entity.freezed.dart';

@freezed
class PointOfOwnerEntity with _$PointOfOwnerEntity {
  const factory PointOfOwnerEntity({
    required double point,
  }) = _PointOfOwnerEntity;
}
