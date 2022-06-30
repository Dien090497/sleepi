import 'package:dartz/dartz.dart';
import 'package:erc20/erc20.dart';
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
  Future<Either<Failure, String>> depositToken({
    required double amount,
    required Credentials owner,
    required ERC20 token,
  }) async {
    try {
      final amountInWei = amount.etherToWei;
      final allowance = await _spendingDataSource.allowance(
          await owner.extractAddress(), token);
      if (allowance.toInt() < amountInWei) {
        await _spendingDataSource.approve(
            owner, amountInWei + allowance.toInt(), token);
      }
      final hash = await _spendingDataSource.toSpending(
          owner: owner, amount: amountInWei, token: token);
      return Right(hash);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
