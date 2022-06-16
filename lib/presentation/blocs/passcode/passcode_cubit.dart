import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_state.dart';
import 'package:slee_fi/usecase/create_pass_code_usecase.dart';

class PasscodeCubit extends Cubit<PasscodeState>{
  PasscodeCubit(String passcode, String mnemonic)
      : super(PasscodeState.initial(passcode,
      mnemonic: mnemonic));

  final TextEditingController passCodeController = TextEditingController();

  final _createPassCodeUC = getIt<CreatePassCodeUseCase>();

  void createPassCode(WalletInfoEntity wallet) async {
    final currentState = state;
    if (currentState is PasscodeStateInitial) {
      final passCode = passCodeController.text;
      final result = await _createPassCodeUC.call(passCode);

      result.fold(
            (l) {
          emit(
              PasscodeState.error(l is FailureMessage ? l.msg : '$l'));
          emit(currentState.copyWith(isLoading: false));
        },
            (success) {
          if (success) {
            emit(PasscodeState.done(wallet));
          }
        },
      );
    }
  }

}