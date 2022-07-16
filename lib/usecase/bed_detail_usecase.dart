import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class BedDetailUseCase extends UseCase<dynamic, int>{
  final IUserRepository _iUserRepository;

  BedDetailUseCase(this._iUserRepository);
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iUserRepository.bedDetail(params);
  }
}