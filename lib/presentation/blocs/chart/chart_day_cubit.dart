import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/draw_chart_entity/data_xy_entity.dart';
import 'package:slee_fi/entities/draw_chart_entity/draw_chart_entity.dart';
import 'package:slee_fi/entities/tracking_result_chart_days_entity/tracking_result_chart_days_entity.dart';
import 'package:slee_fi/models/chart_draw_days/chart_draw_days.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_day_state.dart';
import 'package:slee_fi/usecase/fetch_data_chart_day_usecase.dart';
import 'package:slee_fi/usecase/fetch_data_chart_usecase.dart';
import 'package:slee_fi/usecase/get_slft_price_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ChartDayCubit extends Cubit<ChartDayState> {
  ChartDayCubit() : super(const ChartDayState.initial());

  final _dateUtils = getIt<DateTimeUtils>();
  final _fetchDataDaysChartUseCase = getIt<FetchDataDaysChartUseCase>();
  final _getSlftPriceUseCase = getIt<GetSlftPriceUseCase>();

  int maxY = 0;
  List<DrawChartEntity> listChart = [];
  List<DataXYEntity> listXY = [];

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

  void getDataChart ({List<ChartDrawDays>? data, required TrackingResultChartDaysEntity trackingResultChartDaysEntity, required TypeChart chart}) async {
    final List<FlSpot> flSpot = [];
    if (data != null) {
      for (int i=0; i < data.length; i++) {
        if (maxY < data[i].v) {
          maxY = data[i].v;
        }
        flSpot.add(FlSpot(i.toDouble(), data[i].v.toDouble()));
        listXY.add(DataXYEntity(x: _dateUtils.convertTimeStamp(timeStamp: data[i].t, type: 'hh'), y: data[i].v.toDouble()));
      }
      DrawChartEntity drawChartEntity = DrawChartEntity(
        listFlSpot: flSpot,
        maxX: (data.length.toDouble()) - 1,
        maxy: maxY.toDouble(),
        typeChart: chart,
        listData: listXY,
      );
      listChart.add(drawChartEntity);
    } else {
      maxY = 25;
    }
  }

  Future<void> fetchDataChartDays ({required DateTime fromDate, required DateTime toDate, required String type, bool fistLoad = false, bool? prev}) async {
    final currentState = state;
    if (currentState is ChartDayLoaded) {
      emit(const ChartDayState.loading());
      ParamsGetDataChart params = ParamsGetDataChart(
        fdate: _dateUtils.convertDateTimeWithType(
            dateTime: fromDate, type: 'yyyy-MM-dd'),
        type: type,
        tdate: _dateUtils.convertDateTimeWithType(
            dateTime: toDate, type: 'yyyy-MM-dd'),
      );
      final result = await  _fetchDataDaysChartUseCase.call(params);
      result.fold((l) {
        emit(ChartDayState.error('$l'));
      }, (result) async {
        getDataChart(data: result.chartData, trackingResultChartDaysEntity: result, chart: TypeChart.chartDay);
        final slftPrice = await _getSlftPriceUseCase.call(NoParams());
        slftPrice.fold((l) {
          emit(ChartDayState.error('$l'));
        }, (price) {
          if (fistLoad) {
            final now = DateTime.now();
            emit(ChartDayState.loaded(
                selectedDate: now,
                firstAllowedDate: DateTime.now().subtract(const Duration(days: 60)),
                lastAllowedDate: DateTime.now(),
                dataChart: listChart,
                slftPrice: price,
            ));
          }
        });
      });
     /* if (fistLoad) {
        final now = DateTime.now();
        emit(ChartDayState.loaded(
          selectedDate: now,
          firstAllowedDate: DateTime.now().subtract(const Duration(days: 60)),
          lastAllowedDate: DateTime.now(),
          dataChart: listChart,
        ));
      } else {
        *//*if (prev != null) {
          if (!prev) {
            final nextMonth = _dateUtils.addMonth(currentState.selectedDate, 1);
            if (nextMonth.isBefore(currentState.lastAllowedDate)) {
              emit(currentState.copyWith(selectedDate: nextMonth, dataChart: listChart));
            } else {}
          } else {
            final prevMonth = _dateUtils.subtractMonth(currentState.selectedDate, 1);
            if (prevMonth.isAfter(currentState.firstAllowedDate)) {
              emit(currentState.copyWith(selectedDate: prevMonth, dataChart: listChart));
            } else {}
          }
        }*//*
      }*/
    }
  }

}
