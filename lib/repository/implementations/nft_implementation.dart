import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/network/nft_datasource.dart';
import 'package:slee_fi/datasources/remote/nft_api/nft_api.dart';
import 'package:slee_fi/entities/nft_attribute_entity/nft_attribute_entity.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: INFTRepository)
class NFTImplementation extends INFTRepository {
  final NFTDataSource _nftDataSource;
  final NftApi _nftApi;
  final SecureStorage _secureStorage;

  NFTImplementation(this._nftDataSource, this._nftApi, this._secureStorage);

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
    String? nftAddress,
    required List<BigInt> tokenIds,
    required NftType nftType,
  }) async {
    try {
      final listModel = await _nftApi.getListNft(
        nftType: nftType,
        tokenIds: List.generate(tokenIds.length, (i) => i % 5 + 1)
            .join(','), // TODO: Remove when real data is ready
      );
      // TODO: remove this when data is ready
      if ((listModel.data?.isEmpty ?? true) && nftAddress != null) {
        final res = await Future.wait([
          _nftDataSource.name(nftAddress),
          _nftDataSource.symbol(nftAddress),
        ]);
        return Right(
          tokenIds
              .map(
                (nftId) => NFTEntity(
                    id: 0,
                    name: res.first,
                    symbol: res.last,
                    categoryId: 1,
                    isLock: 1,
                    status: '',
                    attribute: NftAttributeEntity(
                      tokenId: nftId,
                      contractAddress: nftAddress,
                      owner: 'owner',
                      type: 'type',
                      classNft: 'classNft',
                      quality: '',
                      time: 1,
                      level: 1,
                      bedMint: 1,
                      efficiency: 1,
                      luck: 1,
                      bonus: 1,
                      special: 1,
                      resilience: 1,
                      durability: 100,
                      nftId: nftId,
                    )),
              )
              .toList(),
        );
      }
      return Right(listModel.data
              ?.map((e) => e.toEntity(name: '', symbol: ''))
              .toList() ??
          []);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isApprovedForAll(
      {required String nftAddress,
      required String ownerAddress,
      required String operatorAddress,
      required Credentials credentials}) async {
    try {
      return Right(await _nftDataSource.isApprovedForAll(
          address: nftAddress,
          owner: ownerAddress,
          operator: operatorAddress,
          credentials: credentials));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> setApprovalForAll(
      {required String nftAddress,
      required String operatorAddress,
      required Credentials credentials}) async {
    try {
      return Right(await _nftDataSource.setApprovalForAll(
          address: nftAddress,
          operator: operatorAddress,
          credentials: credentials));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> transferNft(
      {required String nftAddress,
      required String ownerAddress,
      required String toAddress,
      required BigInt nftId,
      required Credentials credentials}) async {
    try {
      return Right(await _nftDataSource.transferFrom(
        address: nftAddress,
        from: ownerAddress,
        to: toAddress,
        tokenId: nftId,
        credentials: credentials,
      ));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> depositSpending({
    String? spendingAddress,
    required String nftAddress,
    required BigInt nftId,
    required int userId,
    required Credentials credentials,
  }) async {
    try {
      return Right(await _nftDataSource.depositNft(
        userId: BigInt.from(userId),
        nftId: nftId,
        nftAddress: nftAddress,
        spendingAddress:
            spendingAddress ?? await _secureStorage.readAddressContract() ?? '',
        credentials: credentials,
      ));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, double>> estimateGasFee({
    required String nftAddress,
    required String ownerAddress,
    required String toAddress,
    required BigInt nftId,
    required String functionName,
    EtherAmount? gasPrice,
  }) async {
    try {
      final price = gasPrice ?? await _nftDataSource.getGasPrice();
      return Right(await _nftDataSource.estimateGasFee(
          nftAddress: nftAddress,
          ownerAddress: EthereumAddress.fromHex(ownerAddress),
          toAddress: EthereumAddress.fromHex(toAddress.isNotEmpty
              ? toAddress
              : '0x52839a88e9fdd2b137e32c65fec8e7b3f1f1ccc6'),
          nftId: nftId,
          gasPrice: price,
          functionName: functionName));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
