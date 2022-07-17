import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_model.dart';

part 'tracking_state.freezed.dart';

@freezed
class TrackingState with _$TrackingState {
  const factory TrackingState.initial() = TrackingStateInitial;

  const factory TrackingState.loading() = TrackingStateLoading;

  const factory TrackingState.posted(TrackingResultModel resultModel) = TrackingStatePosted;

  const factory TrackingState.error(String msg) = TrackingStateFail;
}