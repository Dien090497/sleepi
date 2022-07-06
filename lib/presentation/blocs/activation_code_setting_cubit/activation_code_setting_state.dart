import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';

part 'activation_code_setting_state.freezed.dart';

@freezed
class ActivationCodeSettingState with _$ActivationCodeSettingState {

  const factory ActivationCodeSettingState.initial() = ActivationCodeSettingStateInit;

  const factory ActivationCodeSettingState.process() = ActivationCodeSettingStateProcess;

  const factory ActivationCodeSettingState.successful(List<ActiveCodeEntity> list) = ActivationCodeSettingStateSuccess;

  const factory ActivationCodeSettingState.error(String message) =ActivationCodeSettingStateError;
}
