import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/history_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/datasources/remote/network/spending_datasource.dart';
import 'package:slee_fi/entities/staking/staking_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/history_isar/history_isar_model.dart';
import 'package:slee_fi/models/staking_info_response/staking_info_response.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/schema/stacking_schema/stacking_schema.dart';
import 'package:slee_fi/usecase/estimate_gas_deposit_usecase.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: ISpendingRepository)
class SpendingImplementation extends ISpendingRepository {
  final SpendingDataSource _spendingDataSource;
  final AuthDataSource _authDataSource;
  final SecureStorage _secureStorage;
  final GetStorageDataSource _getStorageDataSource;
  final HistoryDataSource _historyDataSource;
  final IsarDataSource _isarDataSource;

  SpendingImplementation(
      this._spendingDataSource,
      this._authDataSource,
      this._secureStorage,
      this._getStorageDataSource,
      this._historyDataSource,
      this._isarDataSource);

  @override
  Future<Either<Failure, String>> depositToken({
    required double amount,
    required Credentials owner,
    required String addressContract,
    required int userId,
    required String type,
  }) async {
    try {
      final amountWei = (Decimal.parse('$amount') *
              Decimal.fromBigInt(BigInt.from(pow(10, 18))))
          .toBigInt();
      if (addressContract == Const.deadAddress) {
        final hash = await _spendingDataSource.toSpendingAvax(
          owner: owner,
          amount: amountWei,
          userId: BigInt.from(userId),
          avax: EthereumAddress.fromHex(Const.deadAddress),
          transaction: Transaction(value: EtherAmount.inWei(amountWei)),
          spendingAddress: await _secureStorage.readAddressContract() ?? '',
        );
        if (hash.isNotEmpty) {
          final chainId = _getStorageDataSource.getCurrentChainId();
          final model = HistoryIsarModel(
              transactionHash: hash,
              chainId: chainId!,
              addressTo: addressContract,
              tokenSymbol: type);
          await _historyDataSource.putHistory(model);
        }
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
      if (hash.isNotEmpty) {
        final chainId = _getStorageDataSource.getCurrentChainId();
        final model = HistoryIsarModel(
            transactionHash: hash,
            chainId: chainId!,
            addressTo: addressContract,
            tokenSymbol: type);
        await _historyDataSource.putHistory(model);
      }
      return Right(hash);
    } catch (e) {
      return Left(FailureMessage.fromRPC(e));
    }
  }

  @override
  Future<Either<Failure, String>> approve(
      {required Credentials owner, required String addressContract}) async {
    try {
      final token = _spendingDataSource.token(addressContract);
      final result = BigInt.parse(
          "115792089237316195423570985008687907853269984665640564039457584007913129639935");
      final spendingAddress = await _secureStorage.readAddressContract() ?? '';
      final txHash = await _spendingDataSource.approve(
          spendingAddress, owner, result, token);
      await Future.delayed(const Duration(seconds: 1));
      return Right(txHash);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> compound() async {
    try {
      final result = await _authDataSource.compound();
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
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
      if (tokenAddress == Const.deadAddress) {
        return const Right(true);
      }
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

  @override
  Future<Either<FailureMessage, double>> estimateGas(
      {required EstimateGasDepositParam params}) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      final gasPrice = await _spendingDataSource.getGasPrice();
      final spendingAddress = await _secureStorage.readAddressContract();
      final gasFee = await _spendingDataSource.estimateGasFee(
        spendingAddress: spendingAddress ?? '',
        ownerAddress: EthereumAddress.fromHex(wallet?.address ?? ''),
        gasPrice: gasPrice,
        functionName: params.functionName,
        data: params.data,
      );
      return Right(gasFee);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
