import 'package:bloc/bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/nft_attribute_entity/nft_attribute_entity.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';
import 'package:slee_fi/usecase/get_list_nft_detail_usecase.dart';

class NftDetailCubit extends Cubit<NftDetailState> {
  NftDetailCubit() : super(const NftDetailState.initial());

  final _getListNftDetailUC = getIt<GetListNftDetailUseCase>();

  Future<void> init(
      WalletInfoEntity walletInfoEntity, TokenEntity token) async {
    final currentState = state;
    final result = await _getListNftDetailUC.call(GetListNftDetailParams(
      address: token.address,
      ownerAddress: walletInfoEntity.address,
      count: 30,
      nftType: NftType.bed,
    ));
    result.fold(
      (l) {
        emit(NftDetailState.loaded(
          walletInfoEntity: walletInfoEntity,
          tokenEntity: token,
          nftEntities: List.generate(
              10,
              (index) => NFTEntity(
                  id: BigInt.from(1),
                  categoryId: 1,
                  isLock: 1,
                  status: 'a',
                  attribute: const NftAttributeEntity(
                      id: 1,
                      tokenId: 1,
                      contractAddress: 'contractAddress',
                      owner: 'owner',
                      type: 'type',
                      classNft: 'classNft',
                      quality: 'quality',
                      time: 1,
                      level: 1,
                      bedMint: 1,
                      efficiency: 1,
                      luck: 1,
                      bonus: 1,
                      special: 1,
                      resilience: 1))),
          hasMore: false,
        ));
        // emit(NftDetailState.error('$l'));
        // emit(currentState);
      },
      (r) {
        emit(NftDetailState.loaded(
          walletInfoEntity: walletInfoEntity,
          tokenEntity: token,
          nftEntities: r,
          hasMore: token.balance > r.length,
        ));
      },
    );
  }

  Future<void> refresh() async {
    final currentState = state;
    if (currentState is NftDetailLoaded) {
      final result = await _getListNftDetailUC.call(GetListNftDetailParams(
        address: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        count: 30,
        nftType: NftType.bed,
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
            nftEntities: r,
            hasMore: currentState.tokenEntity.balance > r.length,
          ));
        },
      );
    }
  }

  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is NftDetailLoaded && currentState.hasMore) {
      final result = await _getListNftDetailUC.call(GetListNftDetailParams(
        address: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        count: 30,
        nftType: NftType.bed,
        start: currentState.nftEntities.length,
      ));
      result.fold(
        (l) {
          emit(NftDetailState.error('$l'));
          emit(currentState.copyWith(hasMore: false));
        },
        (r) {
          final newList = List<NFTEntity>.from(currentState.nftEntities)
            ..addAll(r);
          emit(currentState.copyWith(
            nftEntities: newList,
            hasMore: newList.length < currentState.tokenEntity.balance,
          ));
        },
      );
    }
  }
}
