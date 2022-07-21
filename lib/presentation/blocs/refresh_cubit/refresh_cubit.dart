import 'package:bloc/bloc.dart';
import 'package:slee_fi/presentation/blocs/refresh_cubit/refresh_state.dart';

class RefreshCubit extends Cubit<RefreshState> {
  RefreshCubit() : super(const RefreshState());

  void refreshHome() {
    emit(state.copyWith(refreshHomePage: true));
    emit(state.copyWith(refreshHomePage: false));
  }
}
