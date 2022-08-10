import 'package:dartz/dartz.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class SetNftApprovalForAllUseCase
    extends UseCase<String, SetNftApprovalForAllParams> {
  final INFTRepository _inftRepository;
  final SecureStorage _secureStorage;

  SetNftApprovalForAllUseCase(this._inftRepository, this._secureStorage);

  @override
  Future<Either<Failure, String>> call(
      SetNftApprovalForAllParams params) async {
    try {
      final operatorAddr = params.operatorAddress.isEmpty
          ? await _secureStorage.readAddressContract() ?? ''
          : params.operatorAddress;
      return _inftRepository.setApprovalForAll(
        nftAddress: params.nftAddress,
        operatorAddress: operatorAddr,
        credentials: params.credentials,
      );
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
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
