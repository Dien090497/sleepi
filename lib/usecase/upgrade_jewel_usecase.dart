import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/upgrade_jewel_response/upgrade_jewel_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/upgrade_jewel_schame/upgrade_jewel_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class UpgradeUseCase extends UseCase<UpgradeJewelResponse, UpgradeSchema> {
  final IUserRepository _iUserRepository;

  UpgradeUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, UpgradeJewelResponse>> call(params) {
    return _iUserRepository.upgradeJewel(params);
  }
}
