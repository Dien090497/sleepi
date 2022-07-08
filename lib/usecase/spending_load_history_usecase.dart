import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

import 'spending_load_pending_usecase.dart';

class SpendingLoadHistoryUseCase extends UseCase<dynamic, LoadMoreParams> {
  final IUserRepository _iUserRepository;

  SpendingLoadHistoryUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iUserRepository.fetchHistoryList(params);
  }
}
