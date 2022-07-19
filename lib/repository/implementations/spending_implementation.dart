import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/datasources/remote/network/spending_datasource.dart';
import 'package:slee_fi/entities/staking/staking_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/staking_info_response/staking_info_response.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/schema/stacking_schema/stacking_schema.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: ISpendingRepository)
class SpendingImplementation extends ISpendingRepository {
  final SpendingDataSource _spendingDataSource;
  final AuthDataSource _authDataSource;
  final SecureStorage _secureStorage;

  SpendingImplementation(
      this._spendingDataSource, this._authDataSource, this._secureStorage);

  @override
  Future<Either<Failure, String>> depositToken({
    required double amount,
    required Credentials owner,
    required String addressContract,
    required int userId,
  }) async {
    try {
      final amountWei = BigInt.from(amount * pow(10, 18));
      if (addressContract == Const.listTokenAddressTestNet[2]) {
        final hash = await _spendingDataSource.toSpendingAvax(
          owner: owner,
          amount: amountWei,
          userId: BigInt.from(userId),
          avax: EthereumAddress.fromHex(
              "0x0000000000000000000000000000000000000000"),
          transaction: Transaction(value: EtherAmount.inWei(amountWei)),
          spendingAddress: await _secureStorage.readAddressContract() ?? '',
        );
        return Right(hash);
      }
      final token = _spendingDataSource.token(addressContract);
      final hash = await _spendingDataSource.toSpending(
        owner: owner,
        amount: amountWei,
        token: token,
        userId: BigInt.from(userId),
        spendingAddress: await _secureStorage.readAddressContract() ?? '',
      );
      return Right(hash);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> approve(
      {required Credentials owner, required String addressContract}) async {
    try {
      final token = _spendingDataSource.token(addressContract);
      final result = BigInt.parse(
          "9999999999999999999999999999999999999999999999999999999");
      final txHash = await _spendingDataSource.approve(owner, result, token);
      await Future.delayed(const Duration(seconds: 1));
      return Right(txHash);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> compound() async {
    try {
      final result = await _authDataSource.compound();
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> unStaking() async {
    try {
      final result = await _authDataSource.unStacking();
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, StakingEntity>> stakingSlft(
      {required double amount}) async {
    try {
      StackingSchema schema = StackingSchema(amount: amount.toString());
      final result = await _authDataSource.stacking(schema);
      return Right(result.toEntity());
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, StakingInfoResponse>> getStakingInfo() async {
    try {
      final result = await _authDataSource.getStakingInfo();
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> isAllowanceEnough({
    required String ownerAddress,
    required String tokenAddress,
    required double amount,
  }) async {
    try {
      final token = _spendingDataSource.token(tokenAddress);
      final result = await _spendingDataSource.allowance(
        await _secureStorage.readAddressContract() ?? '',
        EthereumAddress.fromHex(ownerAddress),
        token,
      );
      return Right(result > BigInt.from(amount.etherToWei));
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}