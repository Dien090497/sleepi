import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_state.freezed.dart';

@freezed
class ShareState with _$ShareState{
  const factory ShareState.initial() = ShareStateInitial;

  const factory ShareState.loaded() = ShareStateLoaded;

  const factory ShareState.error(String msg) = ShareStateError;

  const factory ShareState.loading() = ShareStateLoading;
}
