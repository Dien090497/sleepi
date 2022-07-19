import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/home_bed_response/home_bed_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchHomeBedUseCase extends UseCase<List<BedEntity>, FetchHomeBedParam> {
  final IUserRepository _iUserRepository;

  FetchHomeBedUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, List<BedEntity>>> call(params) {
    return _iUserRepository.fetchHomeBed(params);
  }
}

class FetchHomeBedParam {
  final int page;
  final int limit;

  FetchHomeBedParam(this.page, this.limit);
}
