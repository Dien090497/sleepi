import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/bed_detail/bed_detail.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class BedDetailUseCase extends UseCase<BedDetail, int> {
  final IUserRepository _iUserRepository;

  BedDetailUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, BedDetail>> call(params) {
    return _iUserRepository.bedDetail(params);
  }
}
