import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchUpgradeListUseCase extends UseCase<List<BedEntity>, FetchBedParam> {
  final IUserRepository _iUserRepository;

  FetchUpgradeListUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, List<BedEntity>>> call(params) {
    return _iUserRepository.fetchListUpgrade(params);
  }
}
