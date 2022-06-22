import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mint_state.freezed.dart';

@freezed
class MintState with _$MintState {
  const factory MintState.initial() = MintStateInitial;

  const factory MintState.loaded({
    required int indexSelected,
  }) = MintStateSelected;
}
