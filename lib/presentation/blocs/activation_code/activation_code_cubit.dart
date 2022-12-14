import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/activation_code/activation_code_state.dart';
import 'package:slee_fi/presentation/screens/enter_activation_code/enter_activation_code_screen.dart';
import 'package:slee_fi/usecase/check_activation_code_usecase.dart';

class ActivationCodeCubit extends Cubit<ActivationCodeState> {
  ActivationCodeCubit() : super(const ActivationCodeState.initial());

  final _checkActivationCodeUC = getIt<CheckActivationCodeUseCase>();
  String activationCode = '';
  late Locale localeSelected;

  late EnterActiveCodeArg activeCodeArg;

  init(EnterActiveCodeArg enterActiveCodeArg, Locale locale) {
    activeCodeArg = enterActiveCodeArg;
    localeSelected = locale;
  }

  checkActiveCode() async {
    emit(const ActivationCodeState.process());
    if (activeCodeArg.isEnable) {
      if (activationCode.isEmpty) {
        emit(ActivationCodeState.error(LocaleKeys.this_field_is_required.tr()));
        return;
      } else if (activationCode.length < 6) {
        emit(ActivationCodeState.error(LocaleKeys.invalid_code.tr()));
        return;
      }
    }

    final result = await _checkActivationCodeUC.call(activationCode);
    result.fold((l) {
      emit(ActivationCodeState.error(LocaleKeys.invalid_code.tr()));
    }, (r) {
      emit(ActivationCodeState.activeSuccess(activationCode, localeSelected));
    });
  }
}
