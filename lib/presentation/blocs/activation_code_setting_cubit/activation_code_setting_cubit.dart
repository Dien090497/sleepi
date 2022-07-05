import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/presentation/blocs/activation_code_setting_cubit/activation_code_setting_state.dart';

class ActivationCodeSettingCubit extends Cubit<ActivationCodeSettingState> {
  ActivationCodeSettingCubit()
      : super(const ActivationCodeSettingState.initial());

  init() async {
    emit(const ActivationCodeSettingState.process());
    await Future.delayed(
      const Duration(milliseconds: 1000),
      () => emit(const ActivationCodeSettingState.successful()),
    );
  }
}
