import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/usecase/get_balance_token_usecase.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';

class SendToExternalCubit extends Cubit<SendToExternalState> {
  SendToExternalCubit(): super(const SendToExternalState.initial());

  String toAddress = '';
  double? valueInEther;

  final _sendToExternalUC = getIt<SendToExternalUseCase>();

  final _getBalanceToken = getIt<GetBalanceTokenUseCase>();

  void init() {
    emit(const SendToExternalState.initial());
  }

  Future sendToExternal() async {

    var sendToExternalParams = SendToExternalParams(toAddress, valueInEther!);
    final currentState = state;
    if (currentState is sendToExternalStateInitial) {
      emit(currentState.copyWith(isLoading: true));
      final result = await _sendToExternalUC.call(sendToExternalParams);
      result.fold((l) {
        emit(SendToExternalState.errorToAddress(
            l is FailureMessage ? l.msg : '$l'));
      }, (r) {
        emit(SendToExternalState.done(r));
      });
    }
  }

  Future<void> getBalanceToken(String contractAddress) async {
    final result = await _getBalanceToken.call(contractAddress);
    result.fold(
          (l) {
        emit(SendToExternalState.fail(l is FailureMessage ? l.msg : '$l'));
      },
          (success) {
        emit(SendToExternalState.getBalance(success));
      },
    );
  }

  Future<void> estimateGas() async {
     if (toAddress.isEmpty) {
       emit(
           const SendToExternalState.errorToAddress('Please Enter to address'));
       return;
     }
     if (valueInEther == null) {
       emit(const SendToExternalState.errorValueInEther('Please Enter value '));
       return;
     }
     var sendToExternalParams = SendToExternalParams(toAddress, valueInEther!);

     final result = await  _sendToExternalUC.calculatorFee(sendToExternalParams);
     result.fold(
           (l) {
         emit(SendToExternalState.fail(l is FailureMessage ? l.msg : '$l'));
       },
           (success) {
         emit(SendToExternalState.calculatorFee(success));
       },
     );
   }
}
