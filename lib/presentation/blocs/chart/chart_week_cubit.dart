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
            dateTimeUtils.startOfWeek(now), dateTimeUtils.endOfWeek(now))));
  }

  void selectWeek(DatePeriod period) async {
    emit(ChartWeekState.loaded(week: period));
  }

  void nextTap() async {
    final currentState = state;
    if (currentState is ChartWeekLoaded) {
      final start = currentState.week.start;
      final end = currentState.week.end;
      emit(currentState.copyWith(
          week: DatePeriod(
              start.add(const Duration(days: DateTime.daysPerWeek)),
              end.add(const Duration(days: DateTime.daysPerWeek)))));
    }
  }

  void previousTap() async {
    final currentState = state;
    if (currentState is ChartWeekLoaded) {
      final start = currentState.week.start;
      final end = currentState.week.end;
      emit(currentState.copyWith(
          week: DatePeriod(
              start.subtract(const Duration(days: DateTime.daysPerWeek)),
              end.subtract(const Duration(days: DateTime.daysPerWeek)))));
    }
  }
}
