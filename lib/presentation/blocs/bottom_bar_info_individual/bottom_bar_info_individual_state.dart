import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/get_repair_entity/get_repair_entity.dart';
import 'package:slee_fi/models/nft_level_up_response/nft_level_up_response.dart';

part 'bottom_bar_info_individual_state.freezed.dart';

@freezed
class BottomBarInfoIndividualState with _$BottomBarInfoIndividualState {
  const factory BottomBarInfoIndividualState.initial() =
      BottomBarInfoIndividualInitial;

  const factory BottomBarInfoIndividualState.loaded({
    required String gasPrice,
    required bool successTransfer,
    required String transactionFee,
    GetRepairtEntity? feeRepair,
    num? valueRepair,
    num? cost,
  }) = BottomBarInfoIndividualLoaded;

  const factory BottomBarInfoIndividualState.getLevel(
    NftLevelUp levelUp, {
    @Default(false) bool isLoading,
  }) = GetLevelSuccess;

  const factory BottomBarInfoIndividualState.upLevel(
      String remainTime, String levelUpTime) = UpLevelSuccess;

  const factory BottomBarInfoIndividualState.error({required String message}) =
      BottomBarInfoIndividualError;

  const factory BottomBarInfoIndividualState.loading() =
      BottomBarInfoIndividualLoading;

  const factory BottomBarInfoIndividualState.speedUpSuccess() =
      BottomBarInfoIndividualSpeedUpSuccess;
}
