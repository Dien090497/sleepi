import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SpendingLoadPendingUseCase extends UseCase<dynamic, LoadMoreParams> {
  final IUserRepository _iUserRepository;

  SpendingLoadPendingUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iUserRepository.fetchPendingList(params);
  }
}

class LoadMoreParams {
  final int userId;
  final int page;
  final int limit;

  LoadMoreParams(this.userId, this.page, this.limit);
}
