import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_day_state.dart';

class ChartDayCubit extends Cubit<ChartDayState> {
  ChartDayCubit() : super(const ChartDayState.initial());

  void init() async {
    emit(ChartDayState.loaded(
      selectedDate: DateTime.now(),
      lastAllowedDate: DateTime.now(),
      firstAllowedDate: DateTime.now().subtract(const Duration(days: 60)),
    ));
  }

  void selectDay(DateTime day) {
    final currentState = state;
    if (currentState is ChartDayLoaded) {
      emit(currentState.copyWith(selectedDate: day));
    }
  }

  void previousTap() {
    final currentState = state;
    if (currentState is ChartDayLoaded) {
      final prevDay =
          currentState.selectedDate.subtract(const Duration(days: 1));
      // if (prevDay.day < currentState.firstAllowedDate.day) {
      // } else {
      emit(currentState.copyWith(selectedDate: prevDay));
      // }
    }
  }

  void nextTap() {
    final currentState = state;
    if (currentState is ChartDayLoaded) {
      final nextDate = currentState.selectedDate.add(const Duration(days: 1));
      if (nextDate.isBefore(currentState.lastAllowedDate) ||
          nextDate.isAtSameMomentAs(currentState.lastAllowedDate)) {
        emit(currentState.copyWith(selectedDate: nextDate));
      } else {}
    }
  }
}
