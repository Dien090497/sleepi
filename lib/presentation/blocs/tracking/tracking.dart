import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking_state.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
import 'package:slee_fi/usecase/wake_up_usecase.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit() : super(const TrackingState.initial());

  final WakeUpUseCase _wakeUpUseCase = getIt<WakeUpUseCase>();

  Future<void> wakeUp(DataHealthSchema data) async {
    emit(const TrackingState.loading());
    final result = await _wakeUpUseCase.call(data);
    result.fold(
      (l) {
        emit(TrackingState.error('$l'));
      },
      (success) {
        emit(TrackingState.posted(success));
      },
    );
  }

  Future<void> fetchData(time, timeWakeUp) async {
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
            timeWakeUp.subtract(Duration(minutes: time)), timeWakeUp, types);
        healthData = HealthFactory.removeDuplicates(healthData);
        for (var element in healthData) {

          healthDataList.add(convertDataToSchema(element));
        }
        log('health data: ${DataHealthSchema(
          datas: healthDataList,
        ).toJson()}');
        wakeUp(DataHealthSchema(
          datas: healthDataList,
        ));
      } catch (e) {
        log('health data error: $e');
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
}
