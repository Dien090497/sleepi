import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.loaded({
    required List<BedEntity> bedList,
    required BedEntity? selectedBed,
    BedEntity? selectedItem,
    @Default('') String errorMessage,
    @Default(ErrorType.none) ErrorType errorType,
    @Default(true) bool loadMoreBed,
    @Default(false) bool loading,
    @Default(true) bool enableInsurance,
    @Default(true) bool enableAlarm,
    EstimateSleepResponse? tokenEarn,
    @Default(false) bool startTracking,
    UserStatusTrackingModel? userStatusTracking,
  }) = HomeLoaded;

  const factory HomeState.startError(String message) = HomeStartError;

  const factory HomeState.error(String message) = HomeError;
}
