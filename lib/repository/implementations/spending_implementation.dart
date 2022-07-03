import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/remote/network/spending_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/entities/transfer_spending_entity/transfer_spending_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: ISpendingRepository)
class SpendingImplementation extends ISpendingRepository {
  final SpendingDataSource _spendingDataSource;
  final Web3DataSource _web3DataSource;

  SpendingImplementation(this._spendingDataSource, this._web3DataSource);

  @override
  Future<Either<Failure, TransferSpendingEntity>> depositToken({
    required double amount,
    required Credentials owner,
    required String addressContract,
  }) async {
    try {
      final token = _web3DataSource.tokenFrom(addressContract);
      final result = BigInt.from(amount * pow(10, 18)) ;
      final allowance = await _spendingDataSource.allowance(
          await owner.extractAddress(), token);
      if (allowance < result) {
        final entites = TransferSpendingEntity(type: TokenToSpending.approve, txHash: '');
        return Right(entites);
      }
      final hash = await _spendingDataSource.toSpending(
          owner: owner, amount: result, token: token);
      final entites = TransferSpendingEntity(type: TokenToSpending.spending, txHash: hash);
      return Right(entites);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> approve({required Credentials owner, required String addressContract}) async {
    try {
      final token = _web3DataSource.tokenFrom(addressContract);
      final result = BigInt.parse("100000000000000000000000000000000000000000000000000");
    final txHash = await _spendingDataSource.approve(
            owner, result, token);
    return Right(txHash);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
