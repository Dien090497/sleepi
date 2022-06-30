import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:web3dart/web3dart.dart';

abstract class ISpendingRepository {
  Future<Either<Failure, String>> depositToken(
      {required double amount, required Credentials owner});
}
