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

  void init() async {
    final currentState = state;
    if (currentState is NftDetailInitial) {
      final result = await _getNFTsIDsUC.call(GetNFTsIDsParams(
        nftAddress: currentState.tokenEntity.address,
        ownerAddress: currentState.walletInfoEntity.address,
        count: currentState.tokenEntity.balance.toInt(),
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
              nftIds: r));
        },
      );
    }
  }
}
