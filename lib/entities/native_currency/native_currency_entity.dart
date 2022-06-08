import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'native_currency_entity.freezed.dart';

@freezed
class NativeCurrencyEntity with _$NativeCurrencyEntity {
  const factory NativeCurrencyEntity(
    int id,
    String name,
    String symbol,
    int decimals, {
    required String icon,
    required int balance,
    @Default(false) bool balanceUpdated,
  }) = _NativeCurrencyEntity;
}
