import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/models/minting/info_minting_model.dart';
import 'package:slee_fi/models/minting/nft_attribute_minting.dart';

part 'mint_state.freezed.dart';

@freezed
class MintState with _$MintState {
  const factory MintState.initial() = MintStateInitial;

  const factory MintState.loaded({
    @Default(-1) int indexSelected,
    required List<BedEntity> listBed,
    @Default(false) bool isLoadMore,
    @Default(true) bool enableInsurance,
    @Default(false) bool statusMint,
    InfoMintingModel? infoMinting,
    NftAttributeMinting? nftAttributeMinting,
  }) = MintStateLoaded;

  const factory MintState.error(String msg) = MintStateError;

  const factory MintState.mintingError(String msg) = MintStateMintingError;

  const factory MintState.getInfoMint(InfoMintingModel infoMintingModel) = MintStateGetInfo;
}
