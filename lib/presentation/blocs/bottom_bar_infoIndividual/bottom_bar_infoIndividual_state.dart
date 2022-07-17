import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_bar_infoIndividual_state.freezed.dart';

@freezed
class BottomBarInfoIndividualState with _$BottomBarInfoIndividualState {
  const factory BottomBarInfoIndividualState.initial() = BottomBarInfoIndividualInitial;

  const factory BottomBarInfoIndividualState.loaded({
    required String gasPrice,
    required bool successTransfer,
    required String transactionFee,
  }) = BottomBarInfoIndividualLoaded;

  const factory BottomBarInfoIndividualState.error({required String message}) = BottomBarInfoIndividualError;

  const factory BottomBarInfoIndividualState.loading() = BottomBarInfoIndividualLoading;
}
