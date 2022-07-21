import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/upgrade_jewel_info_response/upgrade_info_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class UpgradeInfoUseCase
    extends UseCase<UpgradeInfoResponse, UpgradeInfoParam> {
  final IUserRepository _iUserRepository;

  UpgradeInfoUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, UpgradeInfoResponse>> call(params) {
    return _iUserRepository.upgradeInfo(params);
  }
}

class UpgradeInfoParam {
  final int level;
  final CategoryType categoryType;

  UpgradeInfoParam(this.level, this.categoryType)
      : assert(
            categoryType == CategoryType.jewel ||
                categoryType == CategoryType.item,
            "Do not have function get info upgrade for bed, please select [jewel] or [item]");
}
