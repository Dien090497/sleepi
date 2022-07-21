import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_state.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';
import 'package:slee_fi/schema/nft_sell_schema/nft_sell_schema.dart';
import 'package:slee_fi/schema/repair_schema/repair_schema.dart';
import 'package:slee_fi/schema/with_draw_nft_schema/with_draw_nft_schema.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/get_level_up_usecase.dart';
import 'package:slee_fi/usecase/post_level_up_usecase.dart';
import 'package:slee_fi/usecase/get_repair_usecase.dart';
import 'package:slee_fi/usecase/get_transaction_fee_usecase.dart';
import 'package:slee_fi/usecase/nft_repair_usecase.dart';
import 'package:slee_fi/usecase/nft_sell_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/withdraw_nft_usecase.dart';

class BottomBarInfoIndividualCubit extends Cubit<BottomBarInfoIndividualState> {
  BottomBarInfoIndividualCubit()
      : super(const BottomBarInfoIndividualState.initial());

  final _estimateGasWithdrawUC = getIt<EstimateGasWithdrawUseCase>();
  final _withdrawNFTUseCase = getIt<WithdrawNFTUseCase>();
  final _getLevelUpUC = getIt<GetLevelUpUseCase>();
  final _postLevelUpUC = getIt<PostLevelUpUseCase>();
  final _getTransactionFeeUseCase = getIt<GetTransactionFeeUseCase>();
  final _nftSellUseCase = getIt<NFTSellUseCase>();
  final _getRepairUseCase = getIt<GetRepairUseCase>();
  final _nftRepairUseCase= getIt<NFTRepairUseCase>();

  void init () {
    emit(const BottomBarInfoIndividualState.loaded(gasPrice: '--.--', successTransfer: false, transactionFee: '--.--'));
  }

  void estimateGas({required String contractAddress}) async {
    emit(const BottomBarInfoIndividualState.loading());
    final params = EstimateGasWithdrawParam(contractAddress: contractAddress, type: TransferType.nft.name);
    final result = await _estimateGasWithdrawUC.call(params);
    result.fold((l) {
      emit(BottomBarInfoIndividualState.error(message: '$l'));
    }, (gasPrice) {
      emit(BottomBarInfoIndividualState.loaded(gasPrice: gasPrice, successTransfer: false, transactionFee: ''));
    });
  }

  void transferNFTtoMainWallet({required String contractAddress, required String tokenId}) async {
    final currentState = state;
    emit(const BottomBarInfoIndividualState.loading());
    final params = WithDrawNFTSchema(contractAddress: contractAddress, type: TransferType.nft.name, tokenId: tokenId);
    final result = await _withdrawNFTUseCase.call(params);
    result.fold((l) {
      emit(BottomBarInfoIndividualState.error(message: '$l'));
    }, (result) {
      if (currentState is BottomBarInfoIndividualLoaded) {
        emit(currentState.copyWith(successTransfer: true));
      }
    });
  }

  void getTransactionFee() async {
    emit(const BottomBarInfoIndividualState.loading());
    final result = await _getTransactionFeeUseCase.call(NoParams());
    result.fold((l) {
      emit(BottomBarInfoIndividualState.error(message: '$l'));
    }, (fee) {
      emit(BottomBarInfoIndividualState.loaded(gasPrice: '', successTransfer: false, transactionFee: fee));
    });
  }

  void sellNFT({required String amount, required int nftId }) async {
    final params = NFTSellSchema(amount: amount.replaceAll(',', '.'), nftId: nftId);
    final result = await _nftSellUseCase.call(params);
    result.fold((l) {
      emit(BottomBarInfoIndividualState.error(message: '$l'));
    }, (fee) {
      final currentState = state;
      if (currentState is BottomBarInfoIndividualLoaded) {
        emit(currentState.copyWith(successTransfer: true));
      }
    });
  }

  void getRepair({required num nftId}) async {
    emit(const BottomBarInfoIndividualState.loading());
    final result = await _getRepairUseCase.call(nftId);
    result.fold((l) {
      emit(BottomBarInfoIndividualState.error(message: '$l'));
    }, (feeRepair) {
      emit(BottomBarInfoIndividualState.loaded(gasPrice: '', successTransfer: false, transactionFee: '', feeRepair: feeRepair));
    });
  }

  void repairNFT({required String cost, required int bedId }) async {
    final params = RepairSchema(bedId: bedId, tokenAddress: Const.tokens[1]['address'].toString(), cost: double.parse(cost));
    final result = await _nftRepairUseCase.call(params);
    result.fold((l) {

      emit(BottomBarInfoIndividualState.error(message: '$l'));
    }, (fee) {
      final currentState = state;
      if (currentState is BottomBarInfoIndividualLoaded) {
        emit(currentState.copyWith(successTransfer: true));
      }
    });
  }

  Future<void> getLevelUp(int bedId) async {
    emit(const BottomBarInfoIndividualState.loading());
    final result = await _getLevelUpUC.call(bedId);
    result.fold((l) => emit(BottomBarInfoIndividualState.error(message: '$l')),
        (r) {
      emit(BottomBarInfoIndividualState.getLevel(r));
    });
  }

  Future<void> postLevelUp(LevelUpSchema param) async {
    final result = await _postLevelUpUC.call(param);
    result.fold((l) => emit(BottomBarInfoIndividualState.error(message: '$l')),
        (r) => emit(const BottomBarInfoIndividualState.upLevel()));
  }
}
