import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendToExternalParams {
  final double valueInEther;
  final String toAddress;

  const SendToExternalParams(this.toAddress, this.valueInEther);
}


class SendToExternalUseCase extends UseCase<SendToExternalEntity, SendToExternalParams> {
  final ITransactionRepository _iTransactionRepository;

  SendToExternalUseCase(this._iTransactionRepository);

  @override
  Future<Either<Failure, SendToExternalEntity>> call(SendToExternalParams params) {
    return _iTransactionRepository.sendToExternal(params);
  }

  Future<Either<Failure, double>> calculatorFee(NoParams params) {
    return _iTransactionRepository.calculatorFee();
  }

  Future<Either<Failure, int>> getBalance(NoParams params) {
    return _iTransactionRepository.getBalance();
  }
}
