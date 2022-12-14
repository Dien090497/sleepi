import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CurrentNetworkExplorerUseCase extends UseCase<String, NoParams> {
  final ITransactionRepository _iTransactionRepository;

  CurrentNetworkExplorerUseCase(this._iTransactionRepository);

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return _iTransactionRepository.getCurrentNetworkExplorer();
  }
}
