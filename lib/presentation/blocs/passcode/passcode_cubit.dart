import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_state.dart';
import 'package:slee_fi/usecase/validate_passcode_usecase.dart';

class PasscodeCubit extends Cubit<PasscodeState> {
  PasscodeCubit() : super(const PasscodeState.initial());

  final _validatePasscode = getIt<ValidatePassCodeUseCase>();

  Future<void> validate(String pass) async {
    emit(const PasscodeState.loading());
    await Future.delayed(const Duration(milliseconds: 200));
    final result = await _validatePasscode.call(pass);
    result.fold(
      (l) {
        emit(PasscodeState.error('$l'));
      },
      (success) {
        if (success) {
          emit(const PasscodeState.valid());
        } else {
          emit(const PasscodeState.error(LocaleKeys.incorrect_passcode));
        }
      },
    );
  }
}
