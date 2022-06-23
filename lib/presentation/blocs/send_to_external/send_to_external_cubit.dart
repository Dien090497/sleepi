import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';


class SendToExternalCubit extends Cubit<SendToExternalState> {
  SendToExternalCubit(): super(const SendToExternalState.initial());

  void init(){
    emit(const SendToExternalState.initial());
  }
  //
  // @override
  // Future<void> close() {
  //   // dispose
  //   return super.close();
  // }

  final _sendToExternalUC = getIt<SendToExternalUseCase>();

  void sendToExternal() async {
    final currentState = state;
    if (currentState is sendToExternalStateInitial) {
      emit(currentState.copyWith(isLoading: true));
      final result = await _sendToExternalUC.call(NoParams());
      result.fold(
            (l) {
          emit(SendToExternalState.error(l is FailureMessage ? l.msg : '$l'));
          emit(currentState.copyWith(isLoading: false));
        },
            (success) {
          emit(SendToExternalState.done(success));
          emit(currentState.copyWith(isLoading: false));
        },
      );
    }
  }
}
