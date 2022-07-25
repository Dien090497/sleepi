import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/datasources/remote/network/nft_datasource.dart';
import 'package:slee_fi/datasources/remote/nft_api/nft_api.dart';
import 'package:slee_fi/entities/get_repair_entity/get_repair_entity.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/nft_family/nft_family.dart';
import 'package:slee_fi/entities/nft_sell_response_entity/nft_sell_response_entity.dart';
import 'package:slee_fi/entities/point_of_owner/point_of_owner_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/schema/nft_sell_schema/nft_sell_schema.dart';
import 'package:slee_fi/schema/repair_schema/repair_schema.dart';
import 'package:slee_fi/schema/update_point/update_point_schema.dart';
import 'package:slee_fi/schema/with_draw_nft_schema/with_draw_nft_schema.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: INFTRepository)
class NFTImplementation extends INFTRepository {
  final NFTDataSource _nftDataSource;
  final NftApi _nftApi;
  final SecureStorage _secureStorage;
  final AuthDataSource _authDataSource;

  NFTImplementation(this._nftDataSource, this._nftApi, this._secureStorage,
      this._authDataSource);

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
  }) async {
    try {
      return Right(await _nftDataSource.tokensOf(nftAddress, ownerAddress));
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
      if (tokenIds.isEmpty) return const Right([]);
      final listModel = await _nftApi.getListNft(
        nftType: nftType,
        tokenIds: tokenIds.join(','),
      );
      final res = await Future.wait([
        _nftDataSource.name(nftAddress!),
        _nftDataSource.symbol(nftAddress),
      ]);
      return Right(listModel.data
              ?.map((e) => e.toEntity(name: res.first, symbol: res.last))
              .toList() ??
          []);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isApprovedForAll({
    required String nftAddress,
    required String ownerAddress,
    required String operatorAddress,
    required Credentials credentials,
  }) async {
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
  Future<Either<Failure, String>> setApprovalForAll({
    required String nftAddress,
    required String operatorAddress,
    required Credentials credentials,
  }) async {
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
        nftAddress: nftAddress,
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
    required String functionName,
    required List<dynamic> data,
    EtherAmount? gasPrice,
  }) async {
    try {
      final price = gasPrice ?? await _nftDataSource.getGasPrice();
      return Right(await _nftDataSource.estimateGasFee(
        nftAddress: nftAddress,
        ownerAddress: EthereumAddress.fromHex(ownerAddress),
        gasPrice: price,
        functionName: functionName,
        data: data,
      ));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<TransactionReceipt?> listenTxHash(String txHash) async {
    return _nftDataSource.streamTxHash(txHash: txHash);
  }

  @override
  Future<Either<Failure, dynamic>> withDrawNFTtoMainWallet(
      {required WithDrawNFTSchema params}) async {
    try {
      final signature = await _secureStorage.readSignatureMessage();
      final signer = await _secureStorage.readSigner();
      final schema = WithDrawNFTSchema(
        contractAddress: params.contractAddress,
        type: params.type,
        tokenId: params.tokenId,
        signedMessage: signature,
        signer: signer,
      );
      final result = await _authDataSource.withdrawNFT(schema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, NftSellResponseEntity>> sellNFT(
      {required NFTSellSchema params}) async {
    try {
      final result = await _authDataSource.nftSell(params);
      return Right(result.toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> getTransactionFee() async {
    try {
      final result = await _authDataSource.getTransactionFee();
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, GetRepairtEntity>> getRepair(
      {required num bedId}) async {
    try {
      final result = await _authDataSource.getRepair(bedId);
      return Right(result.data.toEntity());
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> nftRepair(
      {required RepairSchema repairSchema}) async {
    try {
      final result = await _authDataSource.nftRepair(repairSchema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, NftFamilyEntity>> fetchFamily(int bedId) async {
    try {
      return Right((await _nftApi.family(bedId)).toEntity());
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, PointOfOwnerEntity>> pointOf(int bedId) async {
    try {
      return Right((await _authDataSource.pointOf(bedId)).toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> updatePoint(UpdatePointSchema schema) async {
    try {
      return Right((await _authDataSource.updatePoints(schema)).message);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, NftSellResponseEntity>> cancelSell(num nftId) async {
    try {
      final result = await _authDataSource.nftCancelSell(nftId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
