import 'dart:core';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/draw_chart_entity/data_xy_entity.dart';
import 'package:slee_fi/entities/draw_chart_entity/draw_chart_entity.dart';
import 'package:slee_fi/entities/tracking_result_chart_data_entity/tracking_result_chart_data_entity.dart';
import 'package:slee_fi/models/tracking_result_chart/data_x_y.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_week_state.dart';
import 'package:slee_fi/usecase/fetch_data_chart_usecase.dart';

class ChartWeekCubit extends Cubit<ChartWeekState> {
  ChartWeekCubit() : super(const ChartWeekState.initial());

  final dateTimeUtils = getIt<DateTimeUtils>();
  final _fetchDataChartUseCase = getIt<FetchDataChartUseCase>();

  int maxY = 0;
  List<DrawChartEntity> listChart = [];
  List<DataXYEntity> listXY = [];

  void init() async {
    final now = DateTime.now();
    emit(ChartWeekState.loaded(
      week: DatePeriod(dateTimeUtils.startOfWeek(now),
          dateTimeUtils.endOfWeek(now, checkNow: true)),
      firstAllowedDate: DateTime.now().subtract(const Duration(days: 366)),
      lastAllowedDate: DateTime.now().add(const Duration(days: 366)),
    ));
  }

  Future<void> fetchDataChartWeek({required DateTime fromDate, required DateTime toDate, required String type}) async {
    final now = DateTime.now();
    ParamsGetDataChart params = ParamsGetDataChart(
      fdate: dateTimeUtils.convertDateTimeWithType(
          dateTime: fromDate, type: 'yyyy-MM-dd'),
      type: type,
      tdate: dateTimeUtils.convertDateTimeWithType(
          dateTime: toDate, type: 'yyyy-MM-dd'),
    );
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
    });
    emit(ChartWeekState.loaded(
      week: DatePeriod(dateTimeUtils.startOfWeek(now),
          dateTimeUtils.endOfWeek(now, checkNow: true)),
      firstAllowedDate: DateTime.now().subtract(const Duration(days: 366)),
      lastAllowedDate: DateTime.now().add(const Duration(days: 366)),
      dataChart: listChart,
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
      ParamsGetDataChart params = ParamsGetDataChart(
        fdate: dateTimeUtils.convertDateTimeWithType(
            dateTime: nextWeekFirstDate, type: 'yyyy-MM-dd'),
        type: 'week',
        tdate: dateTimeUtils.convertDateTimeWithType(
            dateTime: nextWeekLastDate, type: 'yyyy-MM-dd'),
      );
      final result = await  _fetchDataChartUseCase.call(params);
      result.fold((l) {
      }, (result) {
        listChart.clear();
        getDataChart(data: result.slftChart, trackingResultChartData: result, typeChart: TypeChart.slftChart);
        getDataChart(data: result.sleepScoreChart, trackingResultChartData: result, typeChart: TypeChart.sleepScoreChart);
        getDataChart(data: result.bedTimeChart, trackingResultChartData: result, typeChart: TypeChart.bedTimeChart);
        getDataChart(data: result.sleepOnsetChart, trackingResultChartData: result, typeChart: TypeChart.sleepOnsetChart);
        getDataChart(data: result.wokeUpChart, trackingResultChartData: result, typeChart: TypeChart.wokeUpChart);
        getDataChart(data: result.sleepDurationChart, trackingResultChartData: result, typeChart: TypeChart.sleepDurationChart);
        getDataChart(data: result.timeInBedChart, trackingResultChartData: result, typeChart: TypeChart.timeInBedChart);
        getDataChart(data: result.nocturalAwakenChart, trackingResultChartData: result, typeChart: TypeChart.nocturalAwakenChart);
        if (nextWeekFirstDate.isBefore(currentState.lastAllowedDate) &&
            nextWeekLastDate.isBefore(currentState.lastAllowedDate)) {
          final nextWeek = DatePeriod(nextWeekFirstDate, nextWeekLastDate);
          emit(currentState.copyWith(week: nextWeek, dataChart: listChart));
        } else {}
      });
    }
  }

  void previousTap() async {
    final currentState = state;
    if (currentState is ChartWeekLoaded) {
      final start = currentState.week.start;
      final prevWeekFirstDate =
          start.subtract(const Duration(days: DateTime.daysPerWeek));
      final prevWeekLastDate = dateTimeUtils.endOfWeek(prevWeekFirstDate);
      ParamsGetDataChart params = ParamsGetDataChart(
        fdate: dateTimeUtils.convertDateTimeWithType(
            dateTime: prevWeekFirstDate, type: 'yyyy-MM-dd'),
        type: 'week',
        tdate: dateTimeUtils.convertDateTimeWithType(
            dateTime: prevWeekLastDate, type: 'yyyy-MM-dd'),
      );
      final result = await  _fetchDataChartUseCase.call(params);
      result.fold((l) {
      }, (result) {
        listChart.clear();
        getDataChart(data: result.slftChart, trackingResultChartData: result, typeChart: TypeChart.slftChart);
        getDataChart(data: result.sleepScoreChart, trackingResultChartData: result, typeChart: TypeChart.sleepScoreChart);
        getDataChart(data: result.bedTimeChart, trackingResultChartData: result, typeChart: TypeChart.bedTimeChart);
        getDataChart(data: result.sleepOnsetChart, trackingResultChartData: result, typeChart: TypeChart.sleepOnsetChart);
        getDataChart(data: result.wokeUpChart, trackingResultChartData: result, typeChart: TypeChart.wokeUpChart);
        getDataChart(data: result.sleepDurationChart, trackingResultChartData: result, typeChart: TypeChart.sleepDurationChart);
        getDataChart(data: result.timeInBedChart, trackingResultChartData: result, typeChart: TypeChart.timeInBedChart);
        getDataChart(data: result.nocturalAwakenChart, trackingResultChartData: result, typeChart: TypeChart.nocturalAwakenChart);
        if (prevWeekFirstDate.isAfter(currentState.firstAllowedDate) &&
            prevWeekLastDate.isAfter(currentState.firstAllowedDate)) {
          final nextWeek = DatePeriod(prevWeekFirstDate, prevWeekLastDate);
          emit(currentState.copyWith(week: nextWeek, dataChart: listChart));
        } else {}
      });
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
        listXY.add(DataXYEntity(x: dateTimeUtils.convertTimeStamp(timeStamp: data[i].t, type: 'dd'), y: data[i].v.toDouble()));
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
