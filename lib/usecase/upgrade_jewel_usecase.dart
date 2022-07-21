import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/upgrade_jewel_schame/upgrade_jewel_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class UpgradeUseCase extends UseCase<dynamic, UpgradeSchema> {
  final IUserRepository _iUserRepository;

  UpgradeUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iUserRepository.upgradeJewel(params);
  }
}
