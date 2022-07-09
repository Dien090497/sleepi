import 'dart:core';

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
      week: DatePeriod(dateTimeUtils.startOfWeek(now),
          dateTimeUtils.endOfWeek(now, checkNow: true)),
      firstAllowedDate: DateTime.now().subtract(const Duration(days: 366)),
      lastAllowedDate: DateTime.now().add(const Duration(days: 366)),
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
      final nextWeekFirstDate = dateTimeUtils
          .startOfWeek(start.add(const Duration(days: DateTime.daysPerWeek)));
      if (nextWeekFirstDate.isAfter(DateTime.now())) {
        return;
      }
      DateTime nextWeekLastDate = dateTimeUtils.endOfWeek(nextWeekFirstDate);
      if (nextWeekLastDate.isAfter(DateTime.now())) {
        nextWeekLastDate = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);
      }
      if (nextWeekFirstDate.isBefore(currentState.lastAllowedDate) &&
          nextWeekLastDate.isBefore(currentState.lastAllowedDate)) {
        final nextWeek = DatePeriod(nextWeekFirstDate, nextWeekLastDate);
        emit(currentState.copyWith(week: nextWeek));
      } else {}
    }
  }

  void previousTap() async {
    final currentState = state;
    if (currentState is ChartWeekLoaded) {
      final start = currentState.week.start;
      final prevWeekFirstDate =
          start.subtract(const Duration(days: DateTime.daysPerWeek));
      final prevWeekLastDate = dateTimeUtils.endOfWeek(prevWeekFirstDate);
      if (prevWeekFirstDate.isAfter(currentState.firstAllowedDate) &&
          prevWeekLastDate.isAfter(currentState.firstAllowedDate)) {
        final nextWeek = DatePeriod(prevWeekFirstDate, prevWeekLastDate);
        emit(currentState.copyWith(week: nextWeek));
      } else {}
    }
  }
}
