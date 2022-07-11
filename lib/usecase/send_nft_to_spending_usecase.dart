import 'package:dartz/dartz.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class SendNftToSpendingUseCase
    extends UseCase<String, SendNftToSpendingParams> {
  final INFTRepository _inftRepository;
  final SecureStorage _secureStorage;

  SendNftToSpendingUseCase(this._inftRepository, this._secureStorage);

  @override
  Future<Either<Failure, String>> call(SendNftToSpendingParams params) async {
    final spendingAddr =
        params.spendingAddress ?? await _secureStorage.readAddressContract();
    if (spendingAddr == null) {
      return const Left(FailureMessage('No Spending Address'));
    }
    final isApproveRes = await _inftRepository.isApprovedForAll(
        nftAddress: params.nftAddress,
        ownerAddress: (await params.credentials.extractAddress()).hex,
        operatorAddress: spendingAddr,
        credentials: params.credentials);
    return isApproveRes.fold(
      Left.new,
      (isApproved) async {
        if (isApproved) {
          return _inftRepository.depositSpending(
              spendingAddress: spendingAddr,
              nftAddress: params.nftAddress,
              nftId: params.nftId,
              userId: params.userId,
              credentials: params.credentials);
        } else {
          final approveRes = await _inftRepository.setApprovalForAll(
              nftAddress: params.nftAddress,
              operatorAddress: spendingAddr,
              credentials: params.credentials);
          return approveRes.fold(Left.new, (r) async{
            final txHashRes = await _inftRepository.listenTxHash(r);
            print('### ${txHashRes}');
            return _inftRepository.depositSpending(
                spendingAddress: spendingAddr,
                nftAddress: params.nftAddress,
                nftId: params.nftId,
                userId: params.userId,
                credentials: params.credentials);
          });
        }
      },
    );
  }
}

class SendNftToSpendingParams {
  final String? spendingAddress;
  final String nftAddress;
  final BigInt nftId;
  final int userId;
  final Credentials credentials;

  SendNftToSpendingParams({
    this.spendingAddress,
    required this.nftAddress,
    required this.nftId,
    required this.userId,
    required this.credentials,
  });
}
