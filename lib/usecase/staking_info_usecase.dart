import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/staking_info_response/staking_info_response.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class StakingInfoUseCase extends UseCase<StakingInfoResponse, NoParams> {
  final ISpendingRepository _iSpendingRepository;

  StakingInfoUseCase(this._iSpendingRepository);

  @override
  Future<Either<Failure, StakingInfoResponse>> call(NoParams params) {
    return _iSpendingRepository.getStakingInfo();
  }
}
