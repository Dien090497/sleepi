import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_entity.freezed.dart';

@freezed
class TokenEntity with _$TokenEntity {
  const factory TokenEntity({
    int? id,
    required String address,
    required String displayName,
    required String name,
    required String symbol,
    required String icon,
    required int balance,
    @Default([]) List<String> txns,
  }) = _TokenEntity;
}
