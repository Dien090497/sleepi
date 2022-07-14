import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:fetch_health_data/health.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking_state.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
import 'package:slee_fi/usecase/wake_up_usecase.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit() : super(const TrackingState.initial());

  final WakeUpUseCase _wakeUpUseCase =
      getIt<WakeUpUseCase>();

  Future<void> wakeUp(DataHealthSchema data) async {
    emit(const TrackingState.loading());
    final result = await _wakeUpUseCase.call(data);
    result.fold(
      (l) {
        emit(TrackingState.error('$l'));
      },
      (success) {
        emit(TrackingState.posted(success.isNotEmpty()));
      },
    );
  }

  Future<void> fetchData(int trackingId) async {
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
        healthData = HealthFactory.removeDuplicates(healthData);
        for (var element in healthData) {
          healthDataList.add(convertDataToSchema(element));
        }
        log('health data: ${DataHealthSchema(trackingId: trackingId, datas: healthDataList,).toJson()}');
        wakeUp(DataHealthSchema(trackingId: trackingId, datas: healthDataList,));
      } catch (e) {
        log("Caught exception in getHealthDataFromTypes: $e");
      }
    } else {
      log("Authorization not granted");
    }
  }

  DataHealth convertDataToSchema(HealthDataPoint data) {
    return DataHealth(
        dataType: data.type.name,
        value: data.value.toJson()['numericValue'].toString(),
        platformType: data.platform.name,
        unit: data.unit.name,
        dateFrom:
        '${DateFormat("yyyy-MM-dd'T'HH:mm:ss.sss").format(data.dateFrom)}Z',
        dateTo:
        '${DateFormat("yyyy-MM-dd'T'HH:mm:ss.sss").format(data.dateTo)}Z',
        sourceId: data.sourceId,
        sourceName: data.sourceName);
  }
}
