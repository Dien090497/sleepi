import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendToExternalParams {
  final double valueInEther;
  final String contractAddressTo;

  const SendToExternalParams({required this.contractAddressTo, required this.valueInEther});
}


class SendToExternalUseCase extends UseCase<bool, SendToExternalParams> {
  final ITransactionRepository _iTransactionRepository;

  SendToExternalUseCase(this._iTransactionRepository);

  @override
  Future<Either<Failure, bool>> call(SendToExternalParams params) {
    return _iTransactionRepository.sendToExternal(params);
  }

  Future<Either<Failure, int>> calculatorFee(SendToExternalParams params) {
    return _iTransactionRepository.calculatorFee(params);
  }

  Future<Either<Failure, double>> getTokenBalance(NoParams params) {
    return _iTransactionRepository.getTokenBalance();
  }
}
