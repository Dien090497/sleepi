import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendToExternalParams {
  final double? valueInEther;
  final double? fee;
  final String contractAddressTo;

  const SendToExternalParams(
      {required this.contractAddressTo, this.valueInEther, this.fee});
}

class SendToExternalUseCase extends UseCase<bool, SendToExternalParams> {
  final ITransactionRepository _iTransactionRepository;

  SendToExternalUseCase(this._iTransactionRepository);

  @override
  Future<Either<Failure, bool>> call(SendToExternalParams params) {
    return _iTransactionRepository.sendToExternal(params);
  }

  Future<Either<Failure, String>> calculatorFee(
      SendToExternalParams params) async {
    final result = await _iTransactionRepository.calculatorFee(params);
    return result.fold(
      Left.new,
      (gasLimit) {
        final fee = (gasLimit * 50000000000) / pow(10, 18);
        return Right('$fee');
      },
    );
  }

  Future<Either<Failure, double>> getTokenBalance(NoParams params) {
    return _iTransactionRepository.getTokenBalance();
  }
}
