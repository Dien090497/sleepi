import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:slee_fi/usecase/make_first_open_app_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState()) {
    on<SelectTab>((event, emit) {
      emit(state.copyWith(tabIndex: event.index));
    });
    _makeFirstOpenApp();
  }

  final _makeFirstOpenAppUC = getIt<MakeFirstOpenAppUseCase>();

  _makeFirstOpenApp() async {
    _makeFirstOpenAppUC.call(NoParams());
  }
}
