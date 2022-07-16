import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class EstimateTrackingUseCase
    extends UseCase<EstimateSleepResponse, EstimateTrackingParam> {
  final ISleepTrackingRepository _sleepTrackingRepository;

  EstimateTrackingUseCase(this._sleepTrackingRepository);

  @override
  Future<Either<Failure, EstimateSleepResponse>> call(params) {
    return _sleepTrackingRepository.estimateTracking(params);
  }
}

class EstimateTrackingParam {
  final int bedId;
  final int? itemId;
  final bool isEnableInsurance;

  EstimateTrackingParam({
    required this.bedId,
    this.itemId,
    required this.isEnableInsurance,
  });
}
