import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/get_repair_entity/get_repair_entity.dart';

part 'bottom_bar_infoIndividual_state.freezed.dart';

@freezed
class BottomBarInfoIndividualState with _$BottomBarInfoIndividualState {
  const factory BottomBarInfoIndividualState.initial() = BottomBarInfoIndividualInitial;

  const factory BottomBarInfoIndividualState.loaded({
    required String gasPrice,
    required bool successTransfer,
    required String transactionFee,
    GetRepairtEntity? feeRepair,
  }) = BottomBarInfoIndividualLoaded;

  const factory BottomBarInfoIndividualState.getLevel(dynamic levelUp) = GetLevelSuccess;

  const factory BottomBarInfoIndividualState.upLevel() = UpLevelSuccess;

  const factory BottomBarInfoIndividualState.error({required String message}) = BottomBarInfoIndividualError;

  const factory BottomBarInfoIndividualState.loading() = BottomBarInfoIndividualLoading;
}
