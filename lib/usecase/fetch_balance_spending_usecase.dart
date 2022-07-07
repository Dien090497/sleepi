import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchBalanceSpendingUseCase extends UseCase<dynamic, String> {
  final IUserRepository _iUserRepository;

  FetchBalanceSpendingUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iUserRepository.fetchBalanceSpending(params);
  }
}
