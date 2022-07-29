import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class EstimateDepositTokenGasUseCase extends UseCase<double, EstimateDepositTokenGasParams> {
  final IWalletRepository _iWalletRepository;

  EstimateDepositTokenGasUseCase(this._iWalletRepository);

  @override
  Future<Either<Failure, double>> call(EstimateDepositTokenGasParams params) {
    return _iWalletRepository.estimateDepositTokenGas(
      ownerAddress: params.ownerAddress,
      data: params.data,
    );
  }
}

class EstimateDepositTokenGasParams {
  final String ownerAddress;
  final List<dynamic> data;

  EstimateDepositTokenGasParams({
    required this.ownerAddress,
    required this.data
  });
}
