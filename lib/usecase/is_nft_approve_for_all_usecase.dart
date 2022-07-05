import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class IsNftApproveForAllUseCase
    extends UseCase<bool, IsNftApproveForAllParams> {
  final INFTRepository _inftRepository;

  IsNftApproveForAllUseCase(this._inftRepository);

  @override
  Future<Either<Failure, bool>> call(IsNftApproveForAllParams params) {
    return _inftRepository.isApprovedForAll(
        nftAddress: params.nftAddress,
        ownerAddress: params.ownerAddress,
        operatorAddress: params.operatorAddress,
        credentials: params.credentials);
  }
}

class IsNftApproveForAllParams {
  final String nftAddress;
  final String ownerAddress;
  final String operatorAddress;
  final Credentials credentials;

  IsNftApproveForAllParams(
      {required this.nftAddress,
      required this.ownerAddress,
      required this.operatorAddress,
      required this.credentials});
}
