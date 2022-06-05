import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_month_state.dart';

class ChartMonthCubit extends Cubit<ChartMonthState> {
  ChartMonthCubit() : super(const ChartMonthState.initial());

  void init() async {}
}
