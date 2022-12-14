import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/staking/staking_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/staking_info_response/staking_info_response.dart';
import 'package:slee_fi/usecase/estimate_gas_deposit_usecase.dart';
import 'package:web3dart/web3dart.dart';

abstract class ISpendingRepository {
  Future<Either<Failure, String>> depositToken({
    required int userId,
    required double amount,
    required Credentials owner,
    required String addressContract,
    required String type,
  });

  Future<Either<Failure, String>> approve({
    required Credentials owner,
    required String addressContract,
  });

  Future<Either<Failure, bool>> isAllowanceEnough({
    required String ownerAddress,
    required String tokenAddress,
    required double amount,
  });

  Future<Either<Failure, dynamic>> unStaking();

  Future<Either<Failure, dynamic>> compound();

  Future<Either<FailureMessage, StakingEntity>> stakingSlft(
      {required double amount});

  Future<Either<FailureMessage, StakingInfoResponse>> getStakingInfo();

  Future<Either<FailureMessage, double>> estimateGas({required EstimateGasDepositParam params});

}
