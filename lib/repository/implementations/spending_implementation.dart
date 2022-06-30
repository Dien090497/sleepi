import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/datasources/remote/network/spending_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: ISpendingRepository)
class SpendingImplementation extends ISpendingRepository {
  final SpendingDataSource _spendingDataSource;

  SpendingImplementation(this._spendingDataSource);

  @override
  Future<Either<Failure, String>> depositToken(
      {required double amount, required Credentials owner}) async {
    try {
      final amountInWei = amount.etherToWei;
      final allowance =
          await _spendingDataSource.slftAllowance(await owner.extractAddress());
      if (allowance.toInt() < amountInWei) {
        await _spendingDataSource.slftApprove(
            owner, amountInWei + allowance.toInt());
      }
      final hash = await _spendingDataSource.slftToSpending(
          owner: owner, amount: amountInWei);
      return Right(hash);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
