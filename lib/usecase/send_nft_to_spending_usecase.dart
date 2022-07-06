import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class SendNftToSpendingUseCase
    extends UseCase<String, SendNftToSpendingParams> {
  final INFTRepository _inftRepository;

  SendNftToSpendingUseCase(this._inftRepository);

  @override
  Future<Either<Failure, String>> call(SendNftToSpendingParams params) async {
    return _inftRepository.deposit(
        spendingAddress: params.spendingAddress,
        nftAddress: params.nftAddress,
        amount: params.amount,
        userId: params.userId,
        credentials: params.credentials);
  }
}

class SendNftToSpendingParams {
  final String spendingAddress;
  final String nftAddress;
  final BigInt amount;
  final int userId;
  final Credentials credentials;

  SendNftToSpendingParams({
    required this.spendingAddress,
    required this.nftAddress,
    required this.amount,
    required this.userId,
    required this.credentials,
  });
}
