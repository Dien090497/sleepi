import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_month_state.dart';

class ChartMonthCubit extends Cubit<ChartMonthState> {
  ChartMonthCubit() : super(const ChartMonthState.initial());

  final dateTimeUtils = getIt<DateTimeUtils>();

  void init() async {
    final now = DateTime.now();
    emit(ChartMonthState.loaded(
      selectedDate: now,
      firstAllowedDate:
          DateTime.now().subtract(const Duration(days: 365 * 4 + 1)),
      lastAllowedDate: DateTime.now(),
    ));
  }

  void selectMonth(DateTime month) async {
    final currentState = state;
    if (currentState is ChartMonthLoaded) {
      emit(currentState.copyWith(selectedDate: month));
    }
  }

  void nextTap() async {
    final currentState = state;
    if (currentState is ChartMonthLoaded) {
      // emit(currentState.copyWith(selectedDate: month));
    }
  }

  void previousTap() async {
    final currentState = state;
    if (currentState is ChartMonthLoaded) {}
  }
}
