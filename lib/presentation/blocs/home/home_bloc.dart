import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchData>((event, emit) {
      emit(const HomeState.loaded());
    });
  }
}
