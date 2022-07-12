import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking_state.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
import 'package:slee_fi/usecase/post_health_data_usecase.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit() : super(const TrackingState.initial());

  final PostHealthDataUseCase _healthDataUseCase =
      getIt<PostHealthDataUseCase>();

  Future<void> postHealthData(DataHealthSchema listData) async {
    emit(const TrackingState.loading());
    final result = await _healthDataUseCase.call(listData);
    result.fold(
      (l) {
        emit(TrackingState.error('$l'));
      },
      (success) {
        emit(TrackingState.posted(success.isNotEmpty()));
      },
    );
  }
}
