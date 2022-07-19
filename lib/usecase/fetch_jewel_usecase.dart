import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/fetch_home_bed_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchJewelUseCase extends UseCase<List<JewelEntity>, FetchHomeBedParam> {
  final IUserRepository _iUserRepository;

  FetchJewelUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, List<JewelEntity>>> call(params) {
    return _iUserRepository.fetchListJewel(params);
  }
}
