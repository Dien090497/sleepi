import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ens_entity.freezed.dart';

@freezed
class EnsEntity with _$EnsEntity {
  const factory EnsEntity(int id, String registry) = _EnsEntity;
}
