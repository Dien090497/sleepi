import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class EstimateNftFunctionFeeUseCase extends UseCase<double, EstimateGasParams> {
  final INFTRepository _inftRepository;

  EstimateNftFunctionFeeUseCase(this._inftRepository);

  @override
  Future<Either<Failure, double>> call(EstimateGasParams params) {
    return _inftRepository.estimateGasFee(
      gasPrice: params.gasPrice,
      nftAddress: params.nftAddress,
      functionName: params.functionName,
      ownerAddress: params.ownerAddress,
      data: params.data,
    );
  }
}

class EstimateGasParams {
  final String nftAddress;
  final String ownerAddress;
  final String toAddress;
  final BigInt nftId;
  final EtherAmount? gasPrice;
  final String functionName;
  final List<dynamic> data;

  EstimateGasParams({
    required this.nftAddress,
    required this.ownerAddress,
    required this.toAddress,
    required this.nftId,
    this.gasPrice,
    required this.functionName,
    required this.data,
  });
}
