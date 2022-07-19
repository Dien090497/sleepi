import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/models/minting/info_minting_model.dart';

part 'mint_state.freezed.dart';

@freezed
class MintState with _$MintState {
  const factory MintState.initial() = MintStateInitial;

  const factory MintState.loaded({
    @Default(-1) int indexSelected,
    required List<BedModel> listBed,
    @Default(false) bool isLoadMore,
    @Default(true) bool enableInsurance,
    @Default(false) bool statusMint,
    InfoMintingModel? infoMinting,
  }) = MintStateLoaded;

  const factory MintState.error(String msg) = MintStateError;

}
