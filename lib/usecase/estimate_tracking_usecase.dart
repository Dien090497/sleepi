import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class EstimateTrackingUseCase
    extends UseCase<EstimateSleepResponse, EstimateTrackingParam> {
  final IUserRepository _iUserRepository;

  EstimateTrackingUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, EstimateSleepResponse>> call(params) {
    return _iUserRepository.estimateTracking(params);
  }
}

class EstimateTrackingParam {
  final int bedId;
  final int itemId;
  final bool isEnableInsurance;

  EstimateTrackingParam({
    required this.bedId,
    required this.itemId,
    required this.isEnableInsurance,
  });
}
