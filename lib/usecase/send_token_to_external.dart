import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

@injectable
class SendTokenToExternalUseCase
    extends UseCase<String, SendTokenExternalParams> {
  final ITransactionRepository _iTransactionRepository;

  SendTokenToExternalUseCase(this._iTransactionRepository);

  @override
  Future<Either<FailureMessage, String>> call(SendTokenExternalParams params) {
    return _iTransactionRepository.transferTokenErc20(params);
  }
}

class SendTokenExternalParams {
  final double valueInEther;
  final String toAddress;
  final TokenEntity? tokenEntity;

  const SendTokenExternalParams(
      {required this.toAddress, required this.valueInEther, this.tokenEntity});
}
