import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_week_state.dart';

class ChartWeekCubit extends Cubit<ChartWeekState> {
  ChartWeekCubit() : super(const ChartWeekState.initial());

  final dateTimeUtils = getIt<DateTimeUtils>();

  void init() async {
    final now = DateTime.now();
    emit(ChartWeekState.loaded(
      week: DatePeriod(
          dateTimeUtils.startOfWeek(now), dateTimeUtils.endOfWeek(now)),
      firstAllowedDate: DateTime.now().subtract(const Duration(days: 366)),
      lastAllowedDate: DateTime.now(),
    ));
  }

  void selectWeek(DatePeriod period) async {
    final currentState = state;
    if (currentState is ChartWeekLoaded) {
      emit(currentState.copyWith(week: period));
    }
  }

  void nextTap() async {
    final currentState = state;
    if (currentState is ChartWeekLoaded) {
      final start = currentState.week.start;
      final end = currentState.week.end;
      final nextWeekFirstDate =
          start.add(const Duration(days: DateTime.daysPerWeek));
      // if (nextWeekFirstDate.day > currentState.lastAllowedDate.day) {
      // } else {
        final nextWeek = DatePeriod(nextWeekFirstDate,
            end.add(const Duration(days: DateTime.daysPerWeek)));
        emit(currentState.copyWith(week: nextWeek));
      // }
    }
  }

  void previousTap() async {
    final currentState = state;
    if (currentState is ChartWeekLoaded) {
      final start = currentState.week.start;
      final end = currentState.week.end;
      final prevWeekFirstDate =
          start.add(const Duration(days: DateTime.daysPerWeek));
      if (prevWeekFirstDate.isBefore(currentState.firstAllowedDate)) {
        final nextWeek = DatePeriod(prevWeekFirstDate,
            end.subtract(const Duration(days: DateTime.daysPerWeek)));
        emit(currentState.copyWith(week: nextWeek));
      } else {
      }
    }
  }
}
