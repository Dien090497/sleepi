import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_default_entity.freezed.dart';

@freezed
class TokenDefaultEntity with _$TokenDefaultEntity {
  const factory TokenDefaultEntity({
    int? id,
    required String slft,
    required String slgt,
    required String wavax,
    required String bed,
    required String jewels,
    required String bedBoxes,
    required String items,
    @Default([]) List<String> txns,
  }) = _TokenDefaultEntity;
}
