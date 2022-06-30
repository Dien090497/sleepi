import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_state.dart';
import 'package:slee_fi/usecase/create_pass_code_usecase.dart';
import 'package:slee_fi/usecase/get_passcode_usecase.dart';

class PasscodeCubit extends Cubit<PasscodeState> {
  PasscodeCubit() : super(const PasscodeState.initial());

  final _createPassCodeUC = getIt<CreatePassCodeUseCase>();
  final _getPasscode = getIt<GetPassCodeUseCase>();

  void init() {
    emit(const PasscodeState.initial());
  }

  Future<void> checkPassCode(String pass) async {
    final currentState = state;
    if (currentState is PasscodeStateInitial) {
      final result = await _getPasscode.call(pass);

      result.fold(
        (l) {
          emit(PasscodeState.error(l is FailureMessage ? l.msg : '$l'));
          emit(currentState.copyWith(isLoading: false));
        },
        (success) {
          if (success) {
            emit(const PasscodeState.valid());
          } else {
            emit(const PasscodeState.inValid());
          }
        },
      );
    }
  }

  void createPassCode(String pass) async {
    final currentState = state;
    if (currentState is PasscodeStateInitial) {
      final result = await _createPassCodeUC.call(pass);

      result.fold(
        (l) {
          emit(PasscodeState.error(l is FailureMessage ? l.msg : '$l'));
          emit(currentState.copyWith(isLoading: false));
        },
        (success) {
          if (success) {
            emit(PasscodeState.done(pass));
          }
        },
      );
    }
  }
}
