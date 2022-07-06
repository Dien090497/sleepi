import 'package:bloc/bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';
import 'package:slee_fi/usecase/get_list_nft_detail_usecase.dart';

class NftDetailCubit extends Cubit<NftDetailState> {
  NftDetailCubit(WalletInfoEntity walletInfoEntity, TokenEntity token)
      : super(NftDetailState.initial(walletInfoEntity, tokenEntity: token));

  final _getListNftDetailUC = getIt<GetListNftDetailUseCase>();

  Future<void> init() async {
    final currentState = state;
    if (currentState is NftDetailInitial) {
      final result = await _getListNftDetailUC.call(GetListNftDetailParams(
        address: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        count: 30,
        nftType: NftType.bed,
      ));
      result.fold(
        (l) {
          print('### $l');
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
    if (currentState is NftDetailLoaded) {
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
          emit(currentState);
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
