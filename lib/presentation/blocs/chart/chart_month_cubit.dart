import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/draw_chart_entity/data_xy_entity.dart';
import 'package:slee_fi/entities/draw_chart_entity/draw_chart_entity.dart';
import 'package:slee_fi/entities/tracking_result_chart_data_entity/tracking_result_chart_data_entity.dart';
import 'package:slee_fi/models/tracking_result_chart/data_x_y.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_month_state.dart';
import 'package:slee_fi/usecase/fetch_data_chart_usecase.dart';

class ChartMonthCubit extends Cubit<ChartMonthState> {
  ChartMonthCubit() : super(const ChartMonthState.initial());

  final _dateUtils = getIt<DateTimeUtils>();
  final _fetchDataChartUseCase = getIt<FetchDataChartUseCase>();

  int maxY = 0;
  List<DrawChartEntity> listChart = [];
  List<DataXYEntity> listXY = [];

  void init() async {
    final now = DateTime.now();
    ParamsGetDataChart params = ParamsGetDataChart(fdate: '', type: '', tdate: '');
    final result = await  _fetchDataChartUseCase.call(params);
    result.fold((l) {
    }, (result) {
      getDataChart(data: result.slftChart, trackingResultChartData: result, typeChart: TypeChart.slftChart);
      getDataChart(data: result.sleepScoreChart, trackingResultChartData: result, typeChart: TypeChart.sleepScoreChart);
      getDataChart(data: result.bedTimeChart, trackingResultChartData: result, typeChart: TypeChart.bedTimeChart);
      getDataChart(data: result.sleepOnsetChart, trackingResultChartData: result, typeChart: TypeChart.sleepOnsetChart);
      getDataChart(data: result.wokeUpChart, trackingResultChartData: result, typeChart: TypeChart.wokeUpChart);
      getDataChart(data: result.sleepDurationChart, trackingResultChartData: result, typeChart: TypeChart.sleepDurationChart);
      getDataChart(data: result.timeInBedChart, trackingResultChartData: result, typeChart: TypeChart.timeInBedChart);
      getDataChart(data: result.nocturalAwakenChart, trackingResultChartData: result, typeChart: TypeChart.nocturalAwakenChart);
      //final res = dateTimeUtils.convertTime(timeStamp: result.slftChart?.first.t ?? 0);
      emit(ChartMonthState.loaded(
        selectedDate: now,
        firstAllowedDate:
        DateTime.now().subtract(const Duration(days: 365 * 4 + 1)),
        lastAllowedDate: DateTime.now(),
        dataChart: listChart,
      ));
    });
    /*emit(ChartMonthState.loaded(
      selectedDate: now,
      firstAllowedDate:
          DateTime.now().subtract(const Duration(days: 365 * 4 + 1)),
      lastAllowedDate: DateTime.now(),
    ));*/
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
      final nextMonth = _dateUtils.addMonth(currentState.selectedDate, 1);
      if (nextMonth.isBefore(currentState.lastAllowedDate)) {
        emit(currentState.copyWith(selectedDate: nextMonth));
      } else {}
    }
  }

  void previousTap() async {
    final currentState = state;
    if (currentState is ChartMonthLoaded) {
      final prevMonth = _dateUtils.subtractMonth(currentState.selectedDate, 1);
      if (prevMonth.isAfter(currentState.firstAllowedDate)) {
        emit(currentState.copyWith(selectedDate: prevMonth));
      } else {}
    }
  }

  void getDataChart ({List<DataXY>? data, required TrackingResultChartDataEntity trackingResultChartData, required TypeChart typeChart}) async {
    final List<FlSpot> flSpot = [];
    if (data != null) {
      for (int i=0; i < data.length; i++) {
        if (maxY < data[i].v) {
          maxY = data[i].v;
        }
        flSpot.add(FlSpot(i.toDouble(), data[i].v.toDouble()));
        listXY.add(DataXYEntity(x: _dateUtils.convertTime(timeStamp: data[i].t), y: data[i].v.toDouble()));
      }
      DrawChartEntity drawChartEntity = DrawChartEntity(
        listFlSpot: flSpot,
        maxX: (data.length.toDouble()) - 1,
        maxy: maxY.toDouble(),
        typeChart: typeChart,
        listData: listXY,
      );
      listChart.add(drawChartEntity);
    } else {
      maxY = 25;
    }
  }
}
