import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_state.freezed.dart';

@freezed
class TrackingState with _$TrackingState {
  const factory TrackingState.initial() = TrackingStateInitial;

  const factory TrackingState.loading() = TrackingStateLoading;

  const factory TrackingState.posted(bool success) = TrackingStatePosted;

  const factory TrackingState.error(String msg) = TrackingStateFail;
}