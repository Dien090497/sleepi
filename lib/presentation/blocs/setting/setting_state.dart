import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState.initial() = SettingInitial;

  const factory SettingState.loading() = SettingLoading;

  const factory SettingState.loaded({required NetworkIsarModel network}) = SettingLoaded;

  const factory SettingState.error() = SettingError;

  const factory SettingState.loadUserSuccess(UserInfoEntity userInfoModel) = SettingStateLoadUserSuccess;
}