import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_day_state.dart';

class ChartDayCubit extends Cubit<ChartDayState> {
  ChartDayCubit() : super(const ChartDayState.initial());

  void init() async {
    emit(ChartDayState.loaded(selectedDate: DateTime.now()));
  }

  void selectDay(DateTime day) {
    final currentState = state;
    if(currentState is ChartDayLoaded) {
      emit(currentState.copyWith(selectedDate: day));
    }
  }
}
