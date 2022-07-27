import 'package:bloc/bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';
import 'package:slee_fi/usecase/get_list_nft_detail_usecase.dart';

class NftDetailCubit extends Cubit<NftDetailState> {
  NftDetailCubit() : super(const NftDetailState.initial());

  final _getListNftDetailUC = getIt<GetListNftDetailUseCase>();

  Future<void> init(WalletInfoEntity walletInfoEntity, TokenEntity token,
      NftType nftType) async {
    final result = await _getListNftDetailUC.call(GetListNftDetailParams(
      nftAddress: token.address,
      ownerAddress: walletInfoEntity.address,
      nftType: nftType,
    ));
    result.fold(
      (l) {
        emit(NftDetailState.error('$l'));
      },
      (r) {
        emit(NftDetailState.loaded(
          walletInfoEntity: walletInfoEntity,
          tokenEntity: token,
          nftEntities: r,
          hasMore: token.balance > r.length,
          nftType: nftType,
        ));
      },
    );
  }

  Future<void> refresh() async {
    final currentState = state;
    if (currentState is NftDetailLoaded) {
      final result = await _getListNftDetailUC.call(GetListNftDetailParams(
        nftAddress: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        nftType: currentState.nftType,
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
            nftType: currentState.nftType,
          ));
        },
      );
    }
  }

  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is NftDetailLoaded && currentState.hasMore) {
      final result = await _getListNftDetailUC.call(GetListNftDetailParams(
        nftAddress: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        nftType: currentState.nftType,
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
