import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNFTsBalanceUseCase extends UseCase<List<BigInt>, GetNFTsParams> {
  final INFTRepository _nftRepo;

  GetNFTsBalanceUseCase(this._nftRepo);

  @override
  Future<Either<Failure, List<BigInt>>> call(GetNFTsParams params) async {
    final listRes = await Future.wait(
      List.generate(params.addresses.length,
          (i) => _nftRepo.balanceOf(params.addresses[i], params.ownerAddress)),
    );
    return Right(listRes.map((e) => e.getOrElse(() => BigInt.zero)).toList());
  }
}

class GetNFTsParams {
  final String ownerAddress;
  final List<String> addresses;

  GetNFTsParams(this.ownerAddress, this.addresses);
}
