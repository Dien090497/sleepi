import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/activation_code_setting_cubit/activation_code_setting_state.dart';
import 'package:slee_fi/usecase/activation_code_setting_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ActivationCodeSettingCubit extends Cubit<ActivationCodeSettingState> {
  ActivationCodeSettingCubit()
      : super(const ActivationCodeSettingState.initial());
  final _activationCodeUC = getIt<ActivationCodeSettingUseCase>();

  init() async {
    emit(const ActivationCodeSettingState.process());
    _fetch();
    await Future.delayed(
      const Duration(milliseconds: 1000),
      () => emit(const ActivationCodeSettingState.successful()),
    );
  }

  _fetch()async {
    var result = await  _activationCodeUC.call(NoParams());
    result.fold((l) => null, (r) => null);
  }
}
