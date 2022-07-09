import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/staking/staking_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class StakingUseCase extends UseCase<StakingEntity, double> {
  final ISpendingRepository _iSpendingRepository;

  StakingUseCase(this._iSpendingRepository);

  @override
  Future<Either<Failure, StakingEntity>> call(double params) {
    return _iSpendingRepository.stakingSlft(amount: params);
  }
}
