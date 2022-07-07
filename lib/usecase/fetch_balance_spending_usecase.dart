import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchBalanceSpendingUseCase extends UseCase<List<TokenSpending>, String> {
  final IUserRepository _iUserRepository;

  FetchBalanceSpendingUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, List<TokenSpending>>> call(params) {
    return _iUserRepository.fetchBalanceSpending(params);
  }
}
