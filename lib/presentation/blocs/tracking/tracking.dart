// import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/draw_chart_entity/data_xy_entity.dart';
import 'package:slee_fi/entities/draw_chart_entity/draw_chart_entity.dart';
import 'package:slee_fi/entities/tracking_result_chart_days_entity/tracking_result_chart_days_entity.dart';
import 'package:slee_fi/models/chart_draw_days/chart_draw_days.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_model.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking_state.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
import 'package:slee_fi/usecase/fetch_data_chart_day_usecase.dart';
import 'package:slee_fi/usecase/fetch_data_chart_usecase.dart';
import 'package:slee_fi/usecase/get_slft_price_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wake_up_usecase.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit() : super(const TrackingState.initial());

  final WakeUpUseCase _wakeUpUseCase = getIt<WakeUpUseCase>();
  final _fetchDataDaysChartUseCase = getIt<FetchDataDaysChartUseCase>();
  final _getSlftPriceUseCase = getIt<GetSlftPriceUseCase>();

  final _dateUtils = getIt<DateTimeUtils>();
  int maxY = 0;
  List<DrawChartEntity> listChart = [];
  List<DataXYEntity> listXY = [];

  Future<void> wakeUp(DataHealthSchema data) async {
    final result = await _wakeUpUseCase.call(data);
    result.fold(
      (l) {
        emit(TrackingState.error('$l'));
      },
      (success) {
        _fetchDataChartDays(
            fromDate: DateTime.now().subtract(const Duration(days: 1)),
            toDate: DateTime.now(),
            fistLoad: true,
            resultModel: success);
      },
    );
  }

  Future<void> fetchData(DateTime timeStart) async {
    emit(const TrackingState.loading());
    DateTime now = DateTime.now();
    HealthFactory health = HealthFactory();

    var types = [
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.SLEEP_AWAKE,
      HealthDataType.SLEEP_DEEP,
      HealthDataType.SLEEP_REM,
      HealthDataType.SLEEP_LIGHT,
    ];

    bool accessWasGranted = await health.requestAuthorization(types);

    if (accessWasGranted) {
      try {
        List<DataHealth> healthDataList = [];
        List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
            now.subtract(const Duration(days: 1)), now, types);
        // log('health data: ${healthData.toString()}');
        healthData = HealthFactory.removeDuplicates(healthData);
        for (var element in healthData) {
          if(timeStart.isBefore(element.dateTo)) {
            healthDataList.add(convertDataToSchema(element));
          }
        }
        wakeUp(DataHealthSchema(
          datas: healthDataList,
        ));
      } catch (e) {
        // log('health data error: $e');
        emit(TrackingState.error('$e'));
      }
    } else {
      wakeUp(DataHealthSchema(
        datas: [],
      ));
    }
  }

  DataHealth convertDataToSchema(HealthDataPoint data) {
    return DataHealth(
        dataType: data.type.name,
        value: data.value.toJson()['numericValue'].toString(),
        platformType: data.platform.name,
        unit: data.unit.name,
        dateFrom:
            '${DateFormat("yyyy-MM-dd'T'HH:mm:ss.sss").format(data.dateFrom.toUtc())}Z',
        dateTo:
            '${DateFormat("yyyy-MM-dd'T'HH:mm:ss.sss").format(data.dateTo.toUtc())}Z',
        sourceId: data.sourceId,
        sourceName: data.sourceName);
  }

  void _getDataChart(
      {List<ChartDrawDays>? data,
      required TrackingResultChartDaysEntity trackingResultChartDaysEntity,
      required TypeChart chart}) async {
    final List<FlSpot> flSpot = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        if (maxY < data[i].v) {
          maxY = data[i].v;
        }
        flSpot.add(FlSpot(i.toDouble(), data[i].v.toDouble()));
        listXY.add(DataXYEntity(
            x: _dateUtils.convertTimeStamp(timeStamp: data[i].t, type: 'hh'),
            y: data[i].v.toDouble()));
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

  Future<void> _fetchDataChartDays({
    required DateTime fromDate,
    required DateTime toDate,
    required TrackingResultModel resultModel,
    bool fistLoad = false,
  }) async {
    ParamsGetDataChart params = ParamsGetDataChart(
      fdate: _dateUtils.convertDateTimeWithType(
          dateTime: fromDate, type: 'yyyy-MM-dd'),
      type: 'day',
      tdate: _dateUtils.convertDateTimeWithType(
          dateTime: toDate, type: 'yyyy-MM-dd'),
    );
    final result = await _fetchDataDaysChartUseCase.call(params);
    result.fold((l) {
      emit(TrackingState.error('$l'));
    }, (result) async {
      _getDataChart(
          data: result.chartData,
          trackingResultChartDaysEntity: result,
          chart: TypeChart.chartDay);
      final slftPrice = await _getSlftPriceUseCase.call(NoParams());
      slftPrice.fold((l) {
        emit(TrackingState.error('$l'));
      }, (price) {
        if (fistLoad) {
          emit(TrackingState.posted(resultModel, price, listChart));
        }
      });
    });
  }
}
