import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class SetNftApprovalForAllUseCase
    extends UseCase<String, SetNftApprovalForAllParams> {
  final INFTRepository _inftRepository;

  SetNftApprovalForAllUseCase(this._inftRepository);

  @override
  Future<Either<Failure, String>> call(SetNftApprovalForAllParams params) {
    return _inftRepository.setApprovalForAll(
        nftAddress: params.nftAddress,
        operatorAddress: params.operatorAddress,
        credentials: params.credentials);
  }
}

class SetNftApprovalForAllParams {
  final String nftAddress;
  final String operatorAddress;
  final Credentials credentials;

  SetNftApprovalForAllParams(
      {required this.nftAddress,
      required this.operatorAddress,
      required this.credentials});
}
