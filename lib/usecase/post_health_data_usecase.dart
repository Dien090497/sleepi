import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class PostHealthDataUseCase extends UseCase<dynamic, DataHealthSchema>{
  final ISleepTrackingRepository _iSleepTrackingRepository;

  PostHealthDataUseCase(this._iSleepTrackingRepository);

  @override
  Future<Either<Failure, dynamic>> call(DataHealthSchema params) {
    return _iSleepTrackingRepository.postDataHealth(params);
  }
}