import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_state.dart';
import 'package:slee_fi/usecase/validate_passcode_usecase.dart';

class PasscodeCubit extends Cubit<PasscodeState> {
  PasscodeCubit() : super(const PasscodeState.initial());

  final _validatePasscode = getIt<ValidatePassCodeUseCase>();

  Future<void> validate(String pass) async {
    final currentState = state;
    if (currentState is PasscodeStateInitial) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final result = await _validatePasscode.call(pass);
      result.fold(
        (l) {
          emit(PasscodeState.error('$l'));
          emit(const PasscodeState.initial());
        },
        (success) {
          if (success) {
            emit(const PasscodeState.valid());
          } else {
            emit(const PasscodeState.inValid());
            emit(const PasscodeState.initial());
          }
        },
      );
    }
  }
}
