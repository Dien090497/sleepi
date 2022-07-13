import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/datasources/remote/network/spending_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/entities/staking/staking_entity.dart';
import 'package:slee_fi/entities/transfer_spending_entity/transfer_spending_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/staking_info_response/staking_info_response.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/schema/stacking_schema/stacking_schema.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: ISpendingRepository)
class SpendingImplementation extends ISpendingRepository {
  final SpendingDataSource _spendingDataSource;
  final Web3DataSource _web3DataSource;
  final AuthDataSource _authDataSource;

  SpendingImplementation(this._spendingDataSource, this._web3DataSource, this._authDataSource);

  @override
  Future<Either<Failure, TransferSpendingEntity>> depositToken({
    required double amount,
    required Credentials owner,
    required String addressContract,
    required int userId,
  }) async {
    try {
      final token = _web3DataSource.token(addressContract);
      final result = BigInt.from(amount * pow(10, 18));
      final allowance = await _spendingDataSource.allowance(
          await owner.extractAddress(), token);
      if (allowance < result) {
        final entites =
            TransferSpendingEntity(type: TokenToSpending.approve, txHash: '');
        return Right(entites);
      }
      if (addressContract == Const.listTokenAddressTestNet[2]) {
        final hash = await _spendingDataSource.toSpendingAvax(
            owner: owner,
            amount: result,
            userId: BigInt.from(userId),
            avax: EthereumAddress.fromHex(
                "0x0000000000000000000000000000000000000000"),
            transaction: Transaction(
              value: EtherAmount.inWei(result),
            ));
        final entites = TransferSpendingEntity(
            type: TokenToSpending.spending, txHash: hash);
        return Right(entites);
      }
      final hash = await _spendingDataSource.toSpending(
          owner: owner,
          amount: result,
          token: token,
          userId: BigInt.from(userId));
      final entites =
          TransferSpendingEntity(type: TokenToSpending.spending, txHash: hash);
      return Right(entites);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> approve(
      {required Credentials owner, required String addressContract}) async {
    try {
      final token = _web3DataSource.token(addressContract);
      final result =
          BigInt.parse("100000000000000000000000000000000000000000000000000");
      final txHash = await _spendingDataSource.approve(owner, result, token);
      return Right(txHash);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> compound() async{
    try {
      final result = await _authDataSource.compound();
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> unStaking() async{
    try {
      final result = await _authDataSource.unStacking();
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, StakingEntity>> stakingSlft({required double amount}) async {
    try {
      StackingSchema schema = StackingSchema(amount: amount.toString());
      final result = await _authDataSource.stacking(schema);
      return Right(result.toEntity());
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, StakingInfoResponse>> getStakingInfo() async{
    try {
      final result = await _authDataSource.getStakingInfo();
      return Right(result);
    } on Exception catch (e)  {
      return Left(FailureMessage.fromException(e));
    }
  }

}
