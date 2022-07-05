import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class TransferNftUseCase extends UseCase<String, TransferNftParams> {
  final INFTRepository _inftRepository;

  TransferNftUseCase(this._inftRepository);

  @override
  Future<Either<Failure, String>> call(TransferNftParams params) {
    return _inftRepository.transferNft(
        nftAddress: params.nftAddress,
        ownerAddress: params.ownerAddress,
        toAddress: params.toAddress,
        tokenId: params.tokenId,
        credentials: params.credentials);
  }
}

class TransferNftParams {
  final String nftAddress;
  final String ownerAddress;
  final String toAddress;
  final BigInt tokenId;
  final Credentials credentials;

  TransferNftParams({
    required this.nftAddress,
    required this.ownerAddress,
    required this.toAddress,
    required this.tokenId,
    required this.credentials,
  });
}
