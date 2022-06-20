import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/create_wallet/create_wallet_state.dart';
import 'package:slee_fi/usecase/create_wallet_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CreateWalletCubit extends Cubit<CreateWalletState> {
  CreateWalletCubit(): super(const CreateWalletState.initial('', mnemonic: ''));

  void init(){
    emit(const CreateWalletState.initial('', mnemonic: ''));
  }

  final _createWalletUC = getIt<CreateWalletUseCase>();

  void createWallet() async {
    final currentState = state;
    if (currentState is createWalletStateInitial) {
      emit(currentState.copyWith(isLoading: true));
      final result = await _createWalletUC.call(NoParams());
      result.fold(
        (l) {
          emit(CreateWalletState.error(l is FailureMessage ? l.msg : '$l'));
          emit(currentState.copyWith(isLoading: false));
        },
        (success) {
          emit(CreateWalletState.done(success));
          emit(currentState.copyWith(isLoading: false));
        },
      );
    }
  }
}
