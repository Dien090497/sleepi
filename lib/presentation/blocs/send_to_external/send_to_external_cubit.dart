import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendToExternalCubit extends Cubit<SendToExternalState> {
  SendToExternalCubit(): super(const SendToExternalState.initial());

  String contractAddressTo = '';
  double valueInEther = 0;

  final _sendToExternalUC = getIt<SendToExternalUseCase>();

  void init() {
    emit(const SendToExternalState.initial());
  }

  Future<void> sendToExternal(String contractAddressTo , double valueInEther) async {
    final currentState = state;
    if (currentState is sendToExternalStateInitial) {
      final result = await _sendToExternalUC.call(SendToExternalParams(
          contractAddressTo : contractAddressTo, valueInEther : valueInEther));

      result.fold((l) {
        emit(SendToExternalState.fail(l is FailureMessage ? l.msg : '$l'));
        emit(currentState.copyWith(isLoading: false));
      }, (success)  {
        emit(const SendToExternalState.success());
      });
    }
  }

  Future<void> getTokenBalance() async {
    final result = await _sendToExternalUC.getTokenBalance(NoParams());
    result.fold(
          (l) {
        emit(SendToExternalState.fail(l is FailureMessage ? l.msg : '$l'));
      },
          (success) {
        emit(SendToExternalState.getBalance(success));
      },
    );
  }

  Future<void> estimateGas(String contractAddressTo , double valueInEther) async {
    final result = await _sendToExternalUC.calculatorFee(SendToExternalParams(
        contractAddressTo : contractAddressTo, valueInEther : valueInEther));
    result.fold(
          (l) {
        emit(SendToExternalState.fail(l is FailureMessage ? l.msg : '$l'));
      },
          (success) {
        emit(SendToExternalState.calculatorFee(success));
        emit(const SendToExternalState.calculatorFeeSuccess());
          },
    );
   }

  Future<void> validator(double balance) async {
    if (contractAddressTo.isEmpty) {
      emit(const SendToExternalState.errorToAddress('Please enter contract address'));
      return;
    }
    if (contractAddressTo.startsWith("0x") == false) {
      emit(const SendToExternalState.errorToAddress('You have entered wrong wallet address, optionally prefixed with 0x'));
      return;
    }
    if (contractAddressTo.length < 42) {
      emit(const SendToExternalState.errorToAddress('Must be a hex string with a length of 40'));
      return;
    }
    if (valueInEther == 0) {
      emit(const SendToExternalState.errorValueInEther('Please enter amount'));
      return;
    }
    if (valueInEther > balance) {
      emit(const SendToExternalState.errorValueInEther('Please enter amount smaller balance'));
      return;
    }
    emit(const SendToExternalState.validatorSuccess());
    emit(const SendToExternalState.checkedValidator());
  }
}
