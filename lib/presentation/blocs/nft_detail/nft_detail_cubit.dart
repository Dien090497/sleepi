import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';
import 'package:slee_fi/usecase/get_nfts_ids_usecase.dart';

class NftDetailCubit extends Cubit<NftDetailState> {
  NftDetailCubit(WalletInfoEntity walletInfoEntity, TokenEntity token)
      : super(NftDetailState.initial(walletInfoEntity, tokenEntity: token));

  final _getNFTsIDsUC = getIt<GetNFTsIDsUseCase>();

  Future<void> init() async {
    final currentState = state;
    if (currentState is NftDetailInitial) {
      final result = await _getNFTsIDsUC.call(GetNFTsIDsParams(
        nftAddress: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        count: 30,
      ));
      result.fold(
        (l) {
          emit(NftDetailState.error('$l'));
          emit(currentState);
        },
        (r) {
          emit(NftDetailState.loaded(
            walletInfoEntity: currentState.walletInfoEntity,
            tokenEntity: currentState.tokenEntity,
            nftIds: r,
            hasMore: currentState.tokenEntity.balance > r.length,
          ));
        },
      );
    }
  }

  Future<void> refresh() async {
    final currentState = state;
    if (currentState is NftDetailLoaded) {
      final result = await _getNFTsIDsUC.call(GetNFTsIDsParams(
        nftAddress: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        count: 30,
      ));
      result.fold(
        (l) {
          emit(NftDetailState.error('$l'));
          emit(currentState);
        },
        (r) {
          emit(NftDetailState.loaded(
            walletInfoEntity: currentState.walletInfoEntity,
            tokenEntity: currentState.tokenEntity,
            nftIds: r,
            hasMore: currentState.tokenEntity.balance > r.length,
          ));
        },
      );
    }
  }

  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is NftDetailLoaded) {
      final result = await _getNFTsIDsUC.call(GetNFTsIDsParams(
        nftAddress: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        count: 30,
        start: currentState.nftIds.length,
      ));
      result.fold(
        (l) {
          emit(NftDetailState.error('$l'));
          emit(currentState);
        },
        (r) {
          final newList = List<BigInt>.from(currentState.nftIds)..addAll(r);
          emit(currentState.copyWith(
            nftIds: newList,
            hasMore: newList.length < currentState.tokenEntity.balance,
          ));
        },
      );
    }
  }
}
