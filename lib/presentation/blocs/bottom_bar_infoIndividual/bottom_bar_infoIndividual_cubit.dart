import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_state.dart';
import 'package:slee_fi/schema/with_draw_nft_schema/with_draw_nft_schema.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/withdrawNFT_usecase.dart';

class BottomBarInfoIndividualCubit extends Cubit<BottomBarInfoIndividualState> {
  BottomBarInfoIndividualCubit() : super(const BottomBarInfoIndividualState.initial());

  final _estimateGasWithdrawUC = getIt<EstimateGasWithdrawUseCase>();
  final _withdrawNFTUseCase = getIt<WithdrawNFTUseCase>();

  void init () {
    emit(const BottomBarInfoIndividualState.loaded(gasPrice: '--.--', successTransfer: false));
  }

  void estimateGas({required String contractAddress}) async {
    emit(const BottomBarInfoIndividualState.loading());
    final params = EstimateGasWithdrawParam(contractAddress: contractAddress, type: TransferType.nft.name);
    final result = await _estimateGasWithdrawUC.call(params);
    result.fold((l) {
      emit(BottomBarInfoIndividualState.error(message: '$l'));
    }, (gasPrice) {
      emit(BottomBarInfoIndividualState.loaded(gasPrice: gasPrice, successTransfer: false));
    });
  }

  void transferNFTtoMainWallet({required String contractAddress, required String tokenId}) async {
    final currentState = state;
    emit(const BottomBarInfoIndividualState.loading());
    final params = WithDrawNFTSchema(contractAddress: contractAddress, type: TransferType.nft.name, tokenId: tokenId);
    final result = await _withdrawNFTUseCase.call(params);
    result.fold((l) {
      print('res12 ${l}');
      emit(BottomBarInfoIndividualState.error(message: '$l'));
    }, (result) {

      print('res12xxxx ${result}');
      if (currentState is BottomBarInfoIndividualLoaded) {
        emit(currentState.copyWith(successTransfer: true));
      }
    });
  }
}
