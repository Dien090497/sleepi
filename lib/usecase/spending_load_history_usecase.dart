import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SpendingLoadHistoryUseCase extends UseCase{
  final IUserRepository _iUserRepository;

  SpendingLoadHistoryUseCase(this._iUserRepository);
  @override
  Future<Either<Failure, dynamic>> call(params) {

    _iUserRepository.fetchHistoryList();
    // TODO: implement call
    throw UnimplementedError();
  }
}