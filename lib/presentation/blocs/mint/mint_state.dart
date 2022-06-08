import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/common/enum/enum.dart';

part 'mint_state.freezed.dart';

@freezed
class MintState with _$MintState{
  const factory MintState.initial({required List<BedType> beds}) = MintStateInitial;

  const factory MintState.loading() = MintStateLoading;

}
