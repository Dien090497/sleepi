import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class EstimateSleepTrackingUseCase
    extends UseCase<String, EstimateSleepTrackingParams> {
  final ISleepTrackingRepository _sleepTrackingRepo;

  EstimateSleepTrackingUseCase(this._sleepTrackingRepo);

  @override
  Future<Either<Failure, String>> call(EstimateSleepTrackingParams params) {
    return _sleepTrackingRepo.estimateTracking(
      bedId: params.bedId,
      itemId: params.itemId,
      isEnableInsurance: params.isEnableInsurance,
    );
  }
}

class EstimateSleepTrackingParams {
  final int bedId;
  final int? itemId;
  final bool isEnableInsurance;

  EstimateSleepTrackingParams(
      {required this.bedId, this.itemId, required this.isEnableInsurance});
}
