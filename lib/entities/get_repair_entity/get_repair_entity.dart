import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_repair_entity.freezed.dart';

@freezed
class GetRepairtEntity with _$GetRepairtEntity {
  const factory GetRepairtEntity({
    required String? durability,
    required String? cost,
  }) = _GetRepairtEntity;
}
