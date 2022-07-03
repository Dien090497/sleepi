import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/network/nft_datasource.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';

@Injectable(as: INFTRepository)
class NFTImplementation extends INFTRepository {
  final NFTDataSource _nftDataSource;

  NFTImplementation(this._nftDataSource);

  @override
  Future<Either<Failure, List<NFTEntity>>> getNFTs(
      List<String> addresses, String ownerAddress) async {
    try {
      final List<NFTEntity> result = [];
      for (final addr in addresses) {
        result.add(NFTEntity(
            address: addr,
            name: await _nftDataSource.name(addr),
            symbol: await _nftDataSource.symbol(addr),
            balance: await _nftDataSource.balanceOf(addr, ownerAddress)));
      }
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
