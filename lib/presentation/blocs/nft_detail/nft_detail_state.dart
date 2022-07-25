import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';

part 'nft_detail_state.freezed.dart';

@freezed
class NftDetailState with _$NftDetailState {
  const factory NftDetailState.initial() = NftDetailInitial;

  const factory NftDetailState.loaded({
    required WalletInfoEntity walletInfoEntity,
    required TokenEntity tokenEntity,
    required List<NFTEntity> nftEntities,
    required bool hasMore,
    required NftType nftType,
  }) = NftDetailLoaded;

  const factory NftDetailState.error(String msg) = NftDetailError;
}
