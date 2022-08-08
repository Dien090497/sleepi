import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:decimal/decimal.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendToExternalParams {
  final double? valueInEther;
  final String contractAddressTo;
  final String? tokenSymbol;

  const SendToExternalParams(
      {required this.contractAddressTo, this.tokenSymbol, this.valueInEther});
}

class SendToExternalUseCase extends UseCase<String, SendToExternalParams> {
  final ITransactionRepository _iTransactionRepository;

  SendToExternalUseCase(this._iTransactionRepository);

  @override
  Future<Either<Failure, String>> call(SendToExternalParams params) {
    return _iTransactionRepository.sendToExternal(params);
  }

  Future<Either<Failure, String>> calculatorFee(
      SendToExternalParams params) async {
    final result = await _iTransactionRepository.calculatorFee(params);
    return result.fold(
      Left.new,
      (gasLimit) {
        final fee = Decimal.fromInt(gasLimit * 50000000000) /
            Decimal.parse('${pow(10, 18)}');
        return Right(fee.toDouble().toString());
      },
    );
  }

  Future<Either<Failure, double>> getTokenBalance(SendToExternalParams params) {
    return _iTransactionRepository.getTokenBalance(params);
  }
}
