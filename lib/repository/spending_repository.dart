import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/transfer_spending_entity/transfer_spending_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:web3dart/web3dart.dart';

abstract class ISpendingRepository {
  Future<Either<Failure, TransferSpendingEntity>> depositToken({
    required double amount,
    required Credentials owner,
    required String addressContract,
  });

  Future<Either<Failure, String>> approve({
    required Credentials owner,
    required String addressContract,
  });

}
