import 'package:bloc/bloc.dart';
import 'package:slee_fi/presentation/blocs/global_listener/global_listener_state.dart';

class GlobalListenerCubit extends Cubit<GlobalListenerState> {
  /// Sử dụng để listen và emit action show dialog, show bottom sheet, ...
  GlobalListenerCubit() : super(const GlobalListenerState.initial());

  void newWalletCreated() {
    emit(const GlobalListenerState.newWalletCreated());
    emit(const GlobalListenerState.initial());
  }
}
