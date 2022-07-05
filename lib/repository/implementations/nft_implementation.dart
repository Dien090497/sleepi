import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/remote/network/nft_datasource.dart';
import 'package:slee_fi/datasources/remote/nft_api/nft_api.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';

@Injectable(as: INFTRepository)
class NFTImplementation extends INFTRepository {
  final NFTDataSource _nftDataSource;
  final NftApi _nftApi;

  NFTImplementation(this._nftDataSource, this._nftApi);

  @override
  Future<Either<Failure, BigInt>> balanceOf(
      String address, String ownerAddress) async {
    try {
      return Right(await _nftDataSource.balanceOf(address, ownerAddress));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, List<BigInt>>> tokensOf({
    required String nftAddress,
    required String ownerAddress,
    required int count,
    required int start,
  }) async {
    try {
      return Right(await _nftDataSource.tokensOf(
          nftAddress, ownerAddress, count, start));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, List<NFTEntity>>> getListNftData({
    required List<BigInt> tokenIds,
    required NftType nftType,
    int? page,
    int? limit,
  }) async {
    try {
      final listModel = await _nftApi.getListNft(
        page: page,
        limit: limit,
        nftType: nftType,
        tokenIds: List.generate(5, (i) => i)
            .join(','), // TODO: Remove when real data is ready
      );
      return Right(listModel.data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
